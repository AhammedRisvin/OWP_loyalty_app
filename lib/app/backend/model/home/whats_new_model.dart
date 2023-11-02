// To parse this JSON data, do
//
//     final getWhatsNewModal = getWhatsNewModalFromJson(jsonString);

import 'dart:convert';

GetWhatsNewModal getWhatsNewModalFromJson(String str) =>
    GetWhatsNewModal.fromJson(json.decode(str));

String getWhatsNewModalToJson(GetWhatsNewModal data) =>
    json.encode(data.toJson());

class GetWhatsNewModal {
  int? statusCode;
  List<WhatsNewModal>? data;
  String? message;
  bool? status;

  GetWhatsNewModal({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetWhatsNewModal.fromJson(Map<String, dynamic> json) =>
      GetWhatsNewModal(
        statusCode: json["statusCode"],
        data: List<WhatsNewModal>.from(
            json["data"].map((x) => WhatsNewModal.fromJson(x))),
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

class WhatsNewModal {
  String? id;
  String? name;
  String? description;
  String? app;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  WhatsNewModal({
    this.id,
    this.name,
    this.description,
    this.app,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WhatsNewModal.fromJson(Map<String, dynamic> json) => WhatsNewModal(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        app: json["app"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "app": app,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
