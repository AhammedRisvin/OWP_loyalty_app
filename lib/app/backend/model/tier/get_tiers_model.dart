// To parse this JSON data, do
//
//     final getTiersModel = getTiersModelFromJson(jsonString);

import 'dart:convert';

GetTiersModel getTiersModelFromJson(String str) =>
    GetTiersModel.fromJson(json.decode(str));

String getTiersModelToJson(GetTiersModel data) => json.encode(data.toJson());

class GetTiersModel {
  int? statusCode;
  List<TiersModel>? data;
  String? message;
  bool? status;

  GetTiersModel({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetTiersModel.fromJson(Map<String, dynamic> json) => GetTiersModel(
        statusCode: json["statusCode"],
        data: List<TiersModel>.from(
            json["data"].map((x) => TiersModel.fromJson(x))),
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

class TiersModel {
  String? id;
  String? name;
  int? order;
  int? price;
  int? tokensOnSpend;
  bool? personalizedService;
  bool? freeTeleConsultaion;
  bool? freeTravelConsulation;
  bool? freeDelivery;
  bool? annualGifts;
  bool? birthdayGifts;
  bool? anniversaryGifts;
  bool? discountOffers;
  bool? invitationToSpecialEvents;
  bool? accessToLounge;
  bool? discountAtStores;
  bool? perzonalizedTShirts;
  bool? perzonalizedMug;
  bool? giftVouchers;
  bool? hiddenTiers;
  int? tokensRequired;
  bool? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? tokensPerSteps;
  String? description;

  TiersModel({
    this.id,
    this.name,
    this.order,
    this.price,
    this.tokensOnSpend,
    this.personalizedService,
    this.freeTeleConsultaion,
    this.freeTravelConsulation,
    this.freeDelivery,
    this.annualGifts,
    this.birthdayGifts,
    this.anniversaryGifts,
    this.discountOffers,
    this.invitationToSpecialEvents,
    this.accessToLounge,
    this.discountAtStores,
    this.perzonalizedTShirts,
    this.perzonalizedMug,
    this.giftVouchers,
    this.hiddenTiers,
    this.tokensRequired,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.tokensPerSteps,
    this.description,
  });

  factory TiersModel.fromJson(Map<String, dynamic> json) => TiersModel(
        id: json["_id"],
        name: json["name"],
        order: json["order"],
        price: json["price"],
        tokensOnSpend: json["tokens_on_spend"],
        personalizedService: json["personalized_service"],
        freeTeleConsultaion: json["free_tele_consultaion"],
        freeTravelConsulation: json["free_travel_consulation"],
        freeDelivery: json["free_delivery"],
        annualGifts: json["annual_gifts"],
        birthdayGifts: json["birthday_gifts"],
        anniversaryGifts: json["anniversary_gifts"],
        discountOffers: json["discount_offers"],
        invitationToSpecialEvents: json["invitation_to_special_events"],
        accessToLounge: json["access_to_lounge"],
        discountAtStores: json["discount_at_stores"],
        perzonalizedTShirts: json["perzonalized_t_shirts"],
        perzonalizedMug: json["perzonalized_mug"],
        giftVouchers: json["gift_vouchers"],
        hiddenTiers: json["hidden_tiers"],
        tokensRequired: json["tokens_required"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
        tokensPerSteps: json["tokens_per_steps"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "order": order,
        "price": price,
        "tokens_on_spend": tokensOnSpend,
        "personalized_service": personalizedService,
        "free_tele_consultaion": freeTeleConsultaion,
        "free_travel_consulation": freeTravelConsulation,
        "free_delivery": freeDelivery,
        "annual_gifts": annualGifts,
        "birthday_gifts": birthdayGifts,
        "anniversary_gifts": anniversaryGifts,
        "discount_offers": discountOffers,
        "invitation_to_special_events": invitationToSpecialEvents,
        "access_to_lounge": accessToLounge,
        "discount_at_stores": discountAtStores,
        "perzonalized_t_shirts": perzonalizedTShirts,
        "perzonalized_mug": perzonalizedMug,
        "gift_vouchers": giftVouchers,
        "hidden_tiers": hiddenTiers,
        "tokens_required": tokensRequired,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "__v": v,
        "tokens_per_steps": tokensPerSteps,
        "description": description,
      };
}
