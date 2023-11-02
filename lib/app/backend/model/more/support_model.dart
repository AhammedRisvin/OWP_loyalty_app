// To parse this JSON data, do
//
//     final getSupportModel = getSupportModelFromJson(jsonString);

import 'dart:convert';

GetSupportModel getSupportModelFromJson(String str) =>
    GetSupportModel.fromJson(json.decode(str));

String getSupportModelToJson(GetSupportModel data) =>
    json.encode(data.toJson());

class GetSupportModel {
  int? statusCode;
  List<Support>? data;
  String? message;
  bool? status;

  GetSupportModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetSupportModel.fromJson(Map<String, dynamic> json) =>
      GetSupportModel(
        statusCode: json["statusCode"],
        data: List<Support>.from(json["data"].map((x) => Support.fromJson(x))),
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

class Support {
  String? id;
  String? email;
  String? contact;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Support({
    this.id,
    this.email,
    this.contact,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        id: json["_id"],
        email: json["email"],
        contact: json["contact"],
        isDeleted: json["is_deleted"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "contact": contact,
        "is_deleted": isDeleted,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
