// To parse this JSON data, do
//
//     final bodyAuth = bodyAuthFromJson(jsonString);

import 'dart:convert';

BodyAuth bodyAuthFromJson(String str) => BodyAuth.fromJson(json.decode(str));

String bodyAuthToJson(BodyAuth data) => json.encode(data.toJson());

class BodyAuth {
  static String auth =
      "{\"channel\":\"web\",\"captureType\":\"manual\",\"countable\":true,\"order\":{\"tokenId\":\"256C656CEC8145A7AC656CEC81E5A73E\",\"purchaseNumber\":\"2020101802\",\"amount\":1,\"currency\":\"PEN\"},\"authentication\":{\"eci\":\"05\",\"xid\":\"55620190222103928509\",\"cavv\":\"0000010148677336601400453067730000000000\"}}";
  BodyAuth({
    this.channel,
    this.captureType,
    this.countable,
    this.order,
    this.authentication,
  });

  String channel;
  String captureType;
  bool countable;
  Order order;
  Authentication authentication;

  factory BodyAuth.fromJson(Map<String, dynamic> json) => BodyAuth(
        channel: json["channel"] == null ? null : json["channel"],
        captureType: json["captureType"] == null ? null : json["captureType"],
        countable: json["countable"] == null ? null : json["countable"],
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
        authentication: json["authentication"] == null
            ? null
            : Authentication.fromJson(json["authentication"]),
      );

  Map<String, dynamic> toJson() => {
        "channel": channel == null ? null : channel,
        "captureType": captureType == null ? null : captureType,
        "countable": countable == null ? null : countable,
        "order": order == null ? null : order.toJson(),
        "authentication":
            authentication == null ? null : authentication.toJson(),
      };
}

class Authentication {
  Authentication({
    this.eci,
    this.xid,
    this.cavv,
  });

  String eci;
  String xid;
  String cavv;

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        eci: json["eci"] == null ? null : json["eci"],
        xid: json["xid"] == null ? null : json["xid"],
        cavv: json["cavv"] == null ? null : json["cavv"],
      );

  Map<String, dynamic> toJson() => {
        "eci": eci == null ? null : eci,
        "xid": xid == null ? null : xid,
        "cavv": cavv == null ? null : cavv,
      };
}

class Order {
  Order({
    this.tokenId,
    this.purchaseNumber,
    this.amount,
    this.currency,
  });

  String tokenId;
  String purchaseNumber;
  double amount;
  String currency;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        tokenId: json["tokenId"] == null ? null : json["tokenId"],
        purchaseNumber:
            json["purchaseNumber"] == null ? null : json["purchaseNumber"],
        amount: json["amount"] == null
            ? null
            : double.parse(json["amount"].toString()),
        currency: json["currency"] == null ? null : json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId == null ? null : tokenId,
        "purchaseNumber": purchaseNumber == null ? null : purchaseNumber,
        "amount": amount == null ? null : amount,
        "currency": currency == null ? null : currency,
      };
}
