// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  CardModel({
    this.email,
    this.numCard,
    this.cvv,
    this.month,
    this.year,
  });

  String email;
  String numCard;
  String cvv;
  String month;
  String year;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        email: json["email"] == null ? " " : json["email"],
        numCard: json["numCard"] == null ? "" : json["numCard"],
        cvv: json["cvv"] == null ? "" : json["cvv"],
        month: json["month"] == null ? "" : json["month"],
        year: json["year"] == null ? "" : json["year"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "numCard": numCard == null ? null : numCard,
        "cvv": cvv == null ? null : cvv,
        "month": month == null ? null : month,
        "year": year == null ? null : year,
      };
}
