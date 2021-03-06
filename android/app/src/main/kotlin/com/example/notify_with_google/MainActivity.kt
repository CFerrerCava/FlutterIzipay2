package com.example.notify_with_google

import android.app.Fragment
import android.os.Bundle
import android.util.Base64
import android.widget.Toast
import androidx.fragment.app.FragmentActivity
import androidx.fragment.app.FragmentManager
import com.android.volley.AuthFailureError
import com.android.volley.Request
import com.android.volley.RequestQueue
import com.android.volley.Response
import com.android.volley.toolbox.JsonObjectRequest
import com.android.volley.toolbox.Volley
import com.lyra.sdk.Lyra
import com.lyra.sdk.callback.LyraHandler
import com.lyra.sdk.callback.LyraResponse
import com.lyra.sdk.exception.LyraException
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

class MainActivity: FlutterActivity() {
    private val CHANNEL = "cip.flutter.dev/hi"
    companion object {
        // FIXME: change by the right merchant payment server url
        private const val SERVER_URL = "https://server-izipay-1.herokuapp.com" // without / at the end, example https://myserverurl.com

        // FIXME: change by your public key
        private const val PUBLIC_KEY = "66112487:testpublickey_HBb6HaU7Im3Dm12muHl7xBYWGAZbTihnW8YhOmlzm7dGz"

        // Environment TEST or PRODUCTION, refer to documentation for more information
        // FIXME: change by your targeted environment
        private const val PAYMENT_MODE = "TEST"

        // TRUE to display a "register the card" switch in the payment form
        private const val ASK_REGISTER_PAY = false

        // FIXME: Change by the right REST API Server Name (available in merchant BO: Settings->Shop->REST API Keys)
        private const val API_SERVER_NAME = "https://api.micuentaweb.pe" // without / at the end, example https://myapiservername.com

        // Payment parameters
        // FIXME: change currency for your targeted environment
        private const val CURRENCY = "EUR"
        private const val AMOUNT = "100"
        private const val ORDER_ID = ""

        //Customer informations
        private const val CUSTOMER_EMAIL = "cferrercava@gmail.com"
        private const val CUSTOMER_REFERENCE = "customerReference"

        //Basic auth
        // FIXME: set your basic auth credentials
        private const val SERVER_AUTH_USER = "66112487"
        private const val SERVER_AUTH_TOKEN = "testpassword_nX145IKowwS0p31oYfdy6ep47ljP3bKxhsJbrLRLXmvCm"
        private const val CREDENTIALS: String = "$SERVER_AUTH_USER:$SERVER_AUTH_TOKEN"
    }
    private lateinit var requestQueue: RequestQueue
    private var myContext: FragmentActivity? = null
    private fun getOptions(): HashMap<String, Any> {
        val options = HashMap<String, Any>()

        options[Lyra.OPTION_API_SERVER_NAME] = API_SERVER_NAME

        // android.permission.NFC must be added on AndroidManifest file
        // options[Lyra.OPTION_NFC_ENABLED] = true

        // cards-camera-recognizer dependency must be added on gradle file
        // options[Lyra.OPTION_CARD_SCANNING_ENABLED] = true

        return options
    }

    /*override fun onAttachFragment(fragment: Fragment?) {
        myContext = activity as FragmentActivity
        super.onAttachFragment(fragment)
    }*/
    override fun onCreate(savedInstanceState: Bundle?) {
        try {
            FIXME: Change by the right REST API Server Name (available in merchant BO: Settings->Shop->REST API Keys)
            Lyra.initialize(applicationContext, PUBLIC_KEY, getOptions())
        } catch (exception: Exception) {
            handle possible exceptions when initializing SDK (Ex: invalid public key format)
        }
        requestQueue = Volley.newRequestQueue(applicationContext)
        super.onCreate(savedInstanceState)

    }
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
           if (call.method == "hello"){

               val name = call.arguments as String
               result.success(sayHello(name))
           }
        }
    }
    private fun getPaymentParams(): JSONObject {
        val json = JSONObject()
                .put("currency", CURRENCY)
                .put("amount", AMOUNT)
                .put("orderId", ORDER_ID)
                .put(
                        "customer",
                        JSONObject("{\"email\":$CUSTOMER_EMAIL, \"reference\":$CUSTOMER_REFERENCE}")
                )
                .put("formTokenVersion", Lyra.getFormTokenVersion())
                .put("mode", PAYMENT_MODE)
        if (ASK_REGISTER_PAY) {
            json.put("formAction", "ASK_REGISTER_PAY")
        }
        return json
    }
    private fun getPaymentContext(paymentParams: JSONObject) {
        val jsonObjectRequest: JsonObjectRequest =
                object : JsonObjectRequest(
                        Request.Method.POST, "${SERVER_URL}/createPayment",
                        paymentParams,
                        Response.Listener { response ->
                            //In this sample, we extract the formToken from the serverResponse, call processServerResponse() which execute the process method of the SDK
                            processFormToken(extractFormToken(response.toString()))
                        },
                        Response.ErrorListener { error ->
                            //Please manage your error behaviour here
                            Toast.makeText(
                                    applicationContext,
                                    "Error Creating Payment",
                                    Toast.LENGTH_LONG
                            ).show()
                        }

                ) {
                    /**
                     * Passing some request headers
                     */
                    @Throws(AuthFailureError::class)
                    override fun getHeaders(): Map<String, String> {
                        return constructBasicAuthHeaders()
                    }
                }

        requestQueue.add(jsonObjectRequest)
    }

    /**
     * Return a formToken if extraction is done correctly
     * Return an empty formToken if an error occur -> SDK will return an INVALID_FORMTOKEN exception
     */
    private fun extractFormToken(serverResponse: String): String {
        try {
            val answer = JSONObject(serverResponse).getJSONObject("answer")
            val formToken = answer.optString("formToken")
            if (formToken.isBlank()) {
                // TODO Please manage your error behaviour here
                // in this case, an error is present in the serverResponse, check the returned errorCode errorMessage
                Toast.makeText(applicationContext, "extractFormToken() -> formToken is empty" + "\n" +
                        "errorCode = " + answer.getString("errorCode")!! + "\n" +
                        "errorMessage = " + answer.optString("errorMessage") + "\n" +
                        "detailedErrorCode = " + answer.optString("detailedErrorCode") + "\n" +
                        "detailedErrorMessage = " + answer.optString("detailedErrorMessage"), Toast.LENGTH_LONG).show()
            }
            return formToken
        } catch (throwable: Throwable) {
            // TODO Please manage your error behaviour here
            // in this case, the serverResponse isn't as expected, please check the input serverResponse param
            Toast.makeText(applicationContext, "Cannot extract formToken from serverResponse", Toast.LENGTH_LONG).show()
            return ""
        }
    }

    /**
     * Calls the Lyra Mobile SDK in order to handle the payment operation
     *
     * @param formToken the formToken extracted from the information of the payment session
     */
    private fun processFormToken(formToken: String) {
        // Open the payment form
        val fragManager: FragmentManager = myContext!!.supportFragmentManager
        Lyra.process(fragManager, formToken, object : LyraHandler {
            override fun onSuccess(lyraResponse: LyraResponse) {
                verifyPayment(lyraResponse)
            }

            override fun onError(lyraException: LyraException, lyraResponse: LyraResponse?) {
                Toast.makeText(
                        applicationContext,
                        "Payment fail: ${lyraException.errorMessage}",
                        Toast.LENGTH_LONG
                ).show()
            }
        })
    }
    fun verifyPayment(payload: LyraResponse) {
        val jsonObjectRequest: JsonObjectRequest =
                object : JsonObjectRequest(
                        Method.POST, "${SERVER_URL}/verifyResult",
                        payload,
                        Response.Listener { response ->
                            //Check the response integrity by verifying the hash on your server
                            Toast.makeText(
                                    applicationContext,
                                    "Payment success",
                                    Toast.LENGTH_LONG
                            ).show()
                        },
                        Response.ErrorListener { error ->
                            //Manage error here, please refer to the documentation for more information
                            Toast.makeText(
                                    applicationContext,
                                    "Payment verification fail",
                                    Toast.LENGTH_LONG
                            ).show()
                        }
                ) {
                    /**
                     * Passing some request headers
                     */
                    @Throws(AuthFailureError::class)
                    override fun getHeaders(): Map<String, String> {
                        return constructBasicAuthHeaders()
                    }
                }
        requestQueue.add(jsonObjectRequest)
    }

    private fun constructBasicAuthHeaders(): HashMap<String, String> {
        val headers =
                HashMap<String, String>()
        headers["Content-Type"] = "application/json; charset=utf-8"
        headers["Authorization"] =
                "Basic " + Base64.encodeToString(CREDENTIALS.toByteArray(), Base64.NO_WRAP)
        return headers
    }
    private fun sayHello(name: String): String {

        return "hi $name "
    }
}
