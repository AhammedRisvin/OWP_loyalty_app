// To parse this JSON data, do
//
//     final getsStateAndCityModel = getsStateAndCityModelFromJson(jsonString);

import 'dart:convert';

List<GetsStateAndCityModel> getsStateAndCityModelFromJson(String str) =>
    List<GetsStateAndCityModel>.from(
        json.decode(str).map((x) => GetsStateAndCityModel.fromJson(x)));

String getsStateAndCityModelToJson(List<GetsStateAndCityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetsStateAndCityModel {
  String? id;
  String? name;
  String? iso3;
  String? iso2;
  String? phoneCode;
  String? currency;
  String? region;
  String? emoji;
  List<StateModel>? states;

  GetsStateAndCityModel({
    this.id,
    this.name,
    this.iso3,
    this.iso2,
    this.phoneCode,
    this.currency,
    this.region,
    this.emoji,
    this.states,
  });

  factory GetsStateAndCityModel.fromJson(Map<String, dynamic> json) =>
      GetsStateAndCityModel(
        id: json["_id"],
        name: json["name"],
        iso3: json["iso3"],
        iso2: json["iso2"],
        phoneCode: json["phone_code"],
        currency: json["currency"],
        region: json["region"],
        emoji: json["emoji"],
        states: List<StateModel>.from(
            json["states"].map((x) => StateModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "iso3": iso3,
        "iso2": iso2,
        "phone_code": phoneCode,
        "currency": currency,
        "region": region,
        "emoji": emoji,
        "states": List<dynamic>.from(states!.map((x) => x.toJson())),
      };
}

class StateModel {
  int? id;
  String? name;
  String? stateCode;
  String? latitude;
  String? longitude;
  dynamic type;
  List<City>? cities;

  StateModel({
    this.id,
    this.name,
    this.stateCode,
    this.latitude,
    this.longitude,
    this.type,
    this.cities,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["id"],
        name: json["name"],
        stateCode: json["state_code"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        type: json["type"],
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state_code": stateCode,
        "latitude": latitude,
        "longitude": longitude,
        "type": type,
        "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
      };
}

class City {
  int? id;
  String? name;
  String? latitude;
  String? longitude;

  City({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };
}
