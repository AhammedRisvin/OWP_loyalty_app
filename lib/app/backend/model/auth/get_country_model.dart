// To parse this JSON data, do
//
//     final getCountryModel = getCountryModelFromJson(jsonString);

import 'dart:convert';

List<GetCountryModel> getCountryModelFromJson(String str) =>
    List<GetCountryModel>.from(
        json.decode(str).map((x) => GetCountryModel.fromJson(x)));

String getCountryModelToJson(List<GetCountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCountryModel {
  String? id;
  String? name;
  String? iso3;
  String? iso2;
  String? phoneCode;
  String? currency;
  Region? region;
  String? emoji;

  GetCountryModel({
    this.id,
    this.name,
    this.iso3,
    this.iso2,
    this.phoneCode,
    this.currency,
    this.region,
    this.emoji,
  });

  factory GetCountryModel.fromJson(Map<String, dynamic> json) =>
      GetCountryModel(
        id: json["_id"],
        name: json["name"],
        iso3: json["iso3"],
        iso2: json["iso2"],
        phoneCode: json["phone_code"],
        currency: json["currency"],
        region: regionValues.map[json["region"]],
        emoji: json["emoji"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "iso3": iso3,
        "iso2": iso2,
        "phone_code": phoneCode,
        "currency": currency,
        "region": regionValues.reverse[region],
        "emoji": emoji,
      };
}

enum Region { AFRICA, AMERICAS, ASIA, EMPTY, EUROPE, OCEANIA, POLAR }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Asia": Region.ASIA,
  "": Region.EMPTY,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA,
  "Polar": Region.POLAR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
