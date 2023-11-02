import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/constants.dart';
import '../../utils/prefference.dart';
import '../../utils/urls.dart';

class WalletServices {
  static Future<Response?> getPassbook(
      {required String startDate, required String endDate}) async {
    String token = prefs.getString(Constants.accessToken).toString();
    try {
      http.Response response = await http.get(
          Uri.parse(
              "${Urls.getPassbook}?start=$startDate&end=$endDate&page=1&limit=300&app="),
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//Get coin cost
  static Future<Response> getCoinCost(dynamic body) async {
    String token = prefs.getString(Constants.accessToken).toString();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http.post(Uri.parse(Urls.getCoinCost),
          headers: headers, body: json.encode(body));
      log(response.statusCode.toString());
      log(response.body);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//get wallet
  static Future<Response?> getWallet() async {
    String token = prefs.getString(Constants.accessToken).toString();
    log(token);
    try {
      http.Response response = await http.get(Uri.parse(Urls.getWallet),
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//recharge wallet
  static Future<Response> rechargeWallet(dynamic body) async {
    String token = prefs.getString(Constants.accessToken).toString();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http.post(Uri.parse(Urls.rechargeWallet),
          headers: headers, body: json.encode(body));
      log(response.statusCode.toString());
      log(response.body);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//validate payment
  static Future<Response> validatePayment(dynamic body) async {
    String token = prefs.getString(Constants.accessToken).toString();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http.post(Uri.parse(Urls.validatePayment),
          headers: headers, body: json.encode(body));
      log(response.statusCode.toString());
      log(response.body);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//Wallet transfer
  static Future<Response> walletTransfer(dynamic body) async {
    String token = prefs.getString(Constants.accessToken).toString();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http.post(Uri.parse(Urls.walletTransfer),
          headers: headers, body: json.encode(body));
      log(response.statusCode.toString());
      log(response.body);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//Wallet withdraw
  static Future<Response> walletWithdraw(dynamic body) async {
    String token = prefs.getString(Constants.accessToken).toString();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      http.Response response = await http.post(Uri.parse(Urls.walletWithdraw),
          headers: headers, body: json.encode(body));
      log(response.statusCode.toString());
      log(response.body);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//get my redeem transaction details
  static Future<Response?> getRedeemPassbook() async {
    String token = prefs.getString(Constants.accessToken).toString();
    try {
      http.Response response = await http.get(
          Uri.parse(Urls.getMyRedeemPassbook),
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //get my redeem - country details
  static Future<Response?> getCountryDetails() async {
    try {
      http.Response response =
          await http.get(Uri.parse(Urls.getMyRedeemCountryList), headers: {
        'Content-Type': 'application/json',
      });
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //get my redeem - country  based bank details
  static Future<Response?> getCountrybasedBankDetails(
      {required String countryName}) async {
    try {
      http.Response response = await http.get(
          Uri.parse(Urls.getCountrybasedBankDetails + countryName),
          headers: {
            'Content-Type': 'application/json',
          });
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
