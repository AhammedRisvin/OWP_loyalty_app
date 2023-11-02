import 'dart:convert';

GetCurrentUserDetails getCurrentUserDetailsFromJson(String str) =>
    GetCurrentUserDetails.fromJson(json.decode(str));

String getCurrentUserDetailsToJson(GetCurrentUserDetails data) =>
    json.encode(data.toJson());

class GetCurrentUserDetails {
  int? statusCode;
  Data? data;
  String? message;
  bool? status;

  GetCurrentUserDetails({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetCurrentUserDetails.fromJson(Map<String, dynamic> json) =>
      GetCurrentUserDetails(
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
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

class Data {
  String? id;
  // String? owpId;
  String? email;
  String? userName;
  // String? lastName;
  DateTime? dob;
  // String? communityId;
  String? tier;
  String? countryCode;
  String? countryName;
  // int? mobileNumber;
  // String? place;
  String? currency;
  String? roles;
  bool? isActive;
  bool? isDeleted;
  int? v;
  String? tierExpiry;
  String? fcmToken;

  Data(
      {this.id,
      // this.owpId,
      this.email,
      this.userName,
      // this.lastName,
      this.dob,
      // this.communityId,
      this.tier,
      this.countryCode,
      this.countryName,
      // this.mobileNumber,
      // this.place,
      this.currency,
      this.roles,
      this.isActive,
      this.isDeleted,
      this.v,
      this.tierExpiry,
      this.fcmToken});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["_id"],
      // owpId: json["owp_id"],
      email: json["email"],
      userName: json["username"],
      // lastName: json["last_name"],
      dob: json["dob"],
      // communityId: json["community_id"],
      tier: json["tier"],
      countryCode: json["country_code"],
      countryName: json["country_name"],
      // mobileNumber: json["mobile_number"],
      // place: json["place"],
      currency: json["currency"],
      roles: json["roles"],
      isActive: json["is_active"],
      isDeleted: json["is_deleted"],
      v: json["__v"],
      tierExpiry: json["tier_expiry"],
      fcmToken: json["fcm_token"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        // "owp_id": owpId,
        "email": email,
        "username": userName,
        // "last_name": lastName,
        "dob": dob,
        // "community_id": communityId,
        "tier": tier,
        "country_code": countryCode,
        "country_name": countryName,
        // "mobile_number": mobileNumber,
        // "place": place,
        "currency": currency,
        "roles": roles,
        "is_active": isActive,
        "is_deleted": isDeleted,
        "__v": v,
        "tier_expiry": tierExpiry,
        "fcm_token": fcmToken,
      };
}
