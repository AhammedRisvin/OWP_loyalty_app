// To parse this JSON data, do
//
//     final getBannersModel = getBannersModelFromJson(jsonString);

import 'dart:convert';

GetBannersModel getBannersModelFromJson(String str) =>
    GetBannersModel.fromJson(json.decode(str));

String getBannersModelToJson(GetBannersModel data) =>
    json.encode(data.toJson());

class GetBannersModel {
  int? statusCode;
  List<BannerModel>? data;
  String? message;
  bool? status;

  GetBannersModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetBannersModel.fromJson(Map<String, dynamic> json) =>
      GetBannersModel(
        statusCode: json["statusCode"],
        data: List<BannerModel>.from(
            json["data"].map((x) => BannerModel.fromJson(x))),
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

class BannerModel {
  String? id;
  String? title;
  String? image;
  int? v;

  BannerModel({
    this.id,
    this.title,
    this.image,
    this.v,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["_id"],
        title: json["title"],
        image: json["image"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "image": image,
        "__v": v,
      };
}
