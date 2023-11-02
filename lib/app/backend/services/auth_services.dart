import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/constants.dart';
import '../../utils/prefference.dart';
import '../../utils/urls.dart';

class AuthServices {
//get country list
  static Future<Response?> getCountryList() async {
    try {
      http.Response response = await http.get(
        Uri.parse(Urls.getCountryList),
      );
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//get state list and city

  static Future<Response?> getStateListAndCity({required dynamic id}) async {
    try {
      http.Response response = await http.post(
          Uri.parse(Urls.getStateListAndCity),
          body: json.encode(id),
          headers: {
            'Content-Type': 'application/json',
          });
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//create account services
  static Future<Response?> getCreatAccountService(
      {required dynamic body}) async {
    try {
      http.Response response = await http.post(Uri.parse(Urls.createAccount),
          body: json.encode(body),
          // encoding: Encoding.getByName('utf-8'),
          headers: {
            'Content-Type': 'application/json',
          });
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//Login services
  static Future<Response?> getlogInService({required dynamic data}) async {
    try {
      http.Response response = await http.post(Uri.parse(Urls.logIn),
          body: json.encode(data),
          // encoding: Encoding.getByName('utf-8'),
          headers: {
            'Content-Type': 'application/json',
          });
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//Fcm Send services
  static Future<Response?> postFcmToken({required dynamic data}) async {
    String token = prefs.getString(Constants.accessToken).toString();
    log(token);
    try {
      http.Response response = await http.post(Uri.parse(Urls.fcmSendToBackend),
          body: json.encode(data),
          // encoding: Encoding.getByName('utf-8'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//forgot password services
  static Future<Response?> getForgotPasswordService({
    required dynamic body,
  }) async {
    try {
      String token = prefs.getString(Constants.accessToken).toString();
      http.Response response = await http.post(Uri.parse(Urls.changePassword),
          body: json.encode(body),
          // encoding: Encoding.getByName('utf-8'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
