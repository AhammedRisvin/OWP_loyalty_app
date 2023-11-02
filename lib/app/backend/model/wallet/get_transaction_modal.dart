// To parse this JSON data, do
//
//     final getTransactionModal = getTransactionModalFromJson(jsonString);

import 'dart:convert';

GetTransactionModal getTransactionModalFromJson(String str) =>
    GetTransactionModal.fromJson(json.decode(str));

String getTransactionModalToJson(GetTransactionModal data) =>
    json.encode(data.toJson());

class GetTransactionModal {
  int? statusCode;
  TransactionModal? data;
  String? message;
  bool? status;

  GetTransactionModal({
    this.statusCode,
    this.data,
    this.message,
    this.status,
  });

  factory GetTransactionModal.fromJson(Map<String, dynamic> json) =>
      GetTransactionModal(
        statusCode: json["statusCode"],
        data: TransactionModal.fromJson(json["data"]),
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

class TransactionModal {
  List<History>? history;
  int? totalCount;

  TransactionModal({
    this.history,
    this.totalCount,
  });

  factory TransactionModal.fromJson(Map<String, dynamic> json) =>
      TransactionModal(
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "history": List<dynamic>.from(history!.map((x) => x.toJson())),
        "totalCount": totalCount,
      };
}

class History {
  String? txnId;
  String? rewardId;
  String? paymentGatewayId;
  String? currencyId;
  String? countryId;
  String? receiverId;
  int? fees;
  String? comments;
  String? ecomments;
  String? ipAddress;
  DateTime? txnDate;
  String? txnApp;
  String? txnType;
  String? txnMode;
  String? senderId;
  int? amount;
  int? coin;
  String? txnReason;
  int? status;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  History({
    this.txnId,
    this.rewardId,
    this.paymentGatewayId,
    this.currencyId,
    this.countryId,
    this.receiverId,
    this.fees,
    this.comments,
    this.ecomments,
    this.ipAddress,
    this.txnDate,
    this.txnApp,
    this.txnType,
    this.txnMode,
    this.senderId,
    this.amount,
    this.coin,
    this.txnReason,
    this.status,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        txnId: json["txn_id"],
        rewardId: json["reward_id"],
        paymentGatewayId: json["payment_gateway_id"],
        currencyId: json["currency_id"],
        countryId: json["country_id"],
        receiverId: json["receiver_id"],
        fees: json["fees"],
        comments: json["comments"],
        ecomments: json["ecomments"],
        ipAddress: json["ip_address"],
        txnDate: DateTime.parse(json["txn_date"]),
        txnApp: json["txn_app"],
        txnType: json["txn_type"],
        txnMode: json["txn_mode"],
        senderId: json["sender_id"],
        amount: int.tryParse(json["amount"].toString()),
        coin: json["coin"],
        txnReason: json["txn_reason"],
        status: json["status"],
        id: json["_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "txn_id": txnId,
        "reward_id": rewardId,
        "payment_gateway_id": paymentGatewayId,
        "currency_id": currencyId,
        "country_id": countryId,
        "receiver_id": receiverId,
        "fees": fees,
        "comments": comments,
        "ecomments": ecomments,
        "ip_address": ipAddress,
        "txn_date": txnDate!.toIso8601String(),
        "txn_app": txnApp,
        "txn_type": txnType,
        "txn_mode": txnMode,
        "sender_id": senderId,
        "amount": amount,
        "coin": coin,
        "txn_reason": txnReason,
        "status": status,
        "_id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
