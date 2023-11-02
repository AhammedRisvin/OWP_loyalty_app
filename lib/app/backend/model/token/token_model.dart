// To parse this JSON data, do
//
//     final GetTokenModal = GetTokenModalFromJson(jsonString);

import 'dart:convert';

GetTokenModal getTokenModalFromJson(String str) =>
    GetTokenModal.fromJson(json.decode(str));

String getTokenModalToJson(GetTokenModal data) => json.encode(data.toJson());

class GetTokenModal {
  int? statusCode;
  TokenModal? data;
  String? message;
  bool? status;

  GetTokenModal({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetTokenModal.fromJson(Map<String, dynamic> json) => GetTokenModal(
        statusCode: json["statusCode"],
        data: TokenModal.fromJson(json["data"]),
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

class TokenModal {
  String? userId;
  int? tokens;
  bool? status;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? worth;

  TokenModal(
      {this.userId,
      this.tokens,
      this.status,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.worth});

  factory TokenModal.fromJson(Map<String, dynamic> json) => TokenModal(
      userId: json["user_id"],
      tokens: int.tryParse(json["tokens"]),
      status: json["status"],
      id: json["_id"],
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : null,
      updatedAt: json["updated_at"] != null
          ? DateTime.parse(json["updated_at"])
          : null,
      v: json["__v"],
      worth: json["worth"]);

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "tokens": tokens,
        "status": status,
        "_id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "__v": v,
        "worth": worth
      };
}
