// To parse this JSON data, do
//
//     final getProjectModel = getProjectModelFromJson(jsonString);

import 'dart:convert';

GetProjectModel getProjectModelFromJson(String str) =>
    GetProjectModel.fromJson(json.decode(str));

String getProjectModelToJson(GetProjectModel data) =>
    json.encode(data.toJson());

class GetProjectModel {
  int? statusCode;
  List<ProjectModel>? data;
  String? message;
  bool? status;

  GetProjectModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetProjectModel.fromJson(Map<String, dynamic> json) =>
      GetProjectModel(
        statusCode: json["statusCode"],
        data: List<ProjectModel>.from(
            json["data"].map((x) => ProjectModel.fromJson(x))),
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

class ProjectModel {
  String? id;
  String? title;
  String? description;
  String? image;
  int? v;

  ProjectModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.v,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "image": image,
        "__v": v,
      };
}
