import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notify_with_google/service/app_theme.dart';
import 'package:notify_with_google/service/functions.dart';

class FieldCustom extends StatelessWidget {
  final String errorText;
  final String hint;
  final Color labeTextColor;
  final String labelText;
  final IconData icon;
  final String data;
  final Function callback;
  final int maxLength;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool handError;
  final bool isObscure;
  final Function todosuffixIcon;
  final Function onTap;
  final Function onFocus;
  final double top;
  final bool isVisible;
  final bool isEnabled;
  final bool readOnly;
  final FilteringTextInputFormatter only;
  final double width;
  final FocusNode focusNode;
  const FieldCustom({
    this.only,
    this.readOnly = false,
    this.errorText,
    this.labeTextColor = Colors.white,
    this.isEnabled = true,
    this.hint,
    this.labelText,
    this.icon,
    this.data = '',
    this.callback,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.handError,
    this.isObscure,
    this.todosuffixIcon,
    this.onTap,
    this.onFocus,
    this.top,
    this.isVisible = true,
    this.width = 1,
    this.focusNode,
  }) : super();

  @override
  Widget build(BuildContext context) {
    double border = 10;
    Color color = Functions.getColorFromHex('B4B4B4');
    TextEditingController controller = TextEditingController(text: data);
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    return Visibility(
      child: Container(
        width: MediaQuery.of(context).size.width * width,
        margin: EdgeInsets.only(
          top: top ?? 25,
        ),
        child: Stack(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                  top: 8,
                ),
                child: FocusScope(
                  child: Focus(
                    focusNode: focusNode,
                    onFocusChange: onFocus ?? (_) {},
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        only ?? FilteringTextInputFormatter.singleLineFormatter
                      ],
                      readOnly: readOnly,
                      controller: controller,
                      onChanged: (_) {
                        callback(_);
                      },
                      onTap: onTap,
                      obscureText: isObscure ?? false,
                      maxLength: maxLength,
                      keyboardType: keyboardType ?? TextInputType.text,
                      textInputAction: textInputAction ?? TextInputAction.next,
                      decoration: InputDecoration(
                        errorText:
                            (handError ?? false) ? errorText ?? hint : null,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(border),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 25,
                          top: 15,
                          bottom: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(border),
                          borderSide: BorderSide(
                            color: color,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(border),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(border),
                          borderSide: BorderSide(
                            color: color,
                            width: 1.0,
                          ),
                        ),
                        hintText: hint ?? "Enter email or user",
                        hintStyle: TextStyle(
                          color: AppTheme.allText,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                        suffixIcon: (isObscure != null)
                            ? IconButton(
                                icon: Icon((isObscure ?? false)
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: todosuffixIcon,
                              )
                            : Icon(
                                icon ?? Icons.email_outlined,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  ),
                )),
            Positioned(
              left: 32,
              child: Container(
                decoration: BoxDecoration(
                  color: labeTextColor,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                padding: EdgeInsets.only(
                  left: 11,
                  right: 11,
                ),
                child: Text(
                  labelText ?? 'Enter email or user',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      visible: isVisible,
    );
  }
}
