// To parse this JSON data, do
//
//     final getWalletModal = getWalletModalFromJson(jsonString);

import 'dart:convert';

GetWalletModal getWalletModalFromJson(String str) =>
    GetWalletModal.fromJson(json.decode(str));

String getWalletModalToJson(GetWalletModal data) => json.encode(data.toJson());

class GetWalletModal {
  int? statusCode;
  WalletModal? data;
  String? message;
  bool? status;

  GetWalletModal({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetWalletModal.fromJson(Map<String, dynamic> json) => GetWalletModal(
        statusCode: json["statusCode"],
        data: WalletModal.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data!.toJson(),
        "message": message,
        "status": status,
      };
}

class WalletModal {
  String? id;
  String? userId;
  String? balance;
  String? currency;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  WalletModal({
    this.id,
    this.userId,
    this.balance,
    this.currency,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WalletModal.fromJson(Map<String, dynamic> json) => WalletModal(
        id: json["_id"],
        userId: json["user_id"],
        balance: json["balance"],
        currency: json["currency"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "balance": balance,
        "currency": currency,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
