// To parse this JSON data, do
//
//     final getMyRedeemsModal = getMyRedeemsModalFromJson(jsonString);

import 'dart:convert';

GetMyRedeemsModal getMyRedeemsModalFromJson(String str) =>
    GetMyRedeemsModal.fromJson(json.decode(str));

String getMyRedeemsModalToJson(GetMyRedeemsModal data) =>
    json.encode(data.toJson());

class GetMyRedeemsModal {
  int? statusCode;
  List<MyRedeemsModal>? data;
  String? message;
  bool? status;

  GetMyRedeemsModal({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetMyRedeemsModal.fromJson(Map<String, dynamic> json) =>
      GetMyRedeemsModal(
        statusCode: json["statusCode"],
        data: List<MyRedeemsModal>.from(
            json["data"].map((x) => MyRedeemsModal.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class MyRedeemsModal {
  String? id;
  String? userId;
  int? amount;
  String? country;
  String? bank;
  String? iBan;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  MyRedeemsModal({
    this.id,
    this.userId,
    this.amount,
    this.country,
    this.bank,
    this.iBan,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MyRedeemsModal.fromJson(Map<String, dynamic> json) => MyRedeemsModal(
        id: json["_id"],
        userId: json["user_id"],
        amount: json["amount"],
        country: json["country"],
        bank: json["bank"],
        iBan: json["i_ban"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "amount": amount,
        "country": country,
        "bank": bank,
        "i_ban": iBan,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
