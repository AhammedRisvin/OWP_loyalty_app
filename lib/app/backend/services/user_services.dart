import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/constants.dart';
import '../../utils/prefference.dart';
import '../../utils/urls.dart';

class UserService {
//Get current user
  static Future<Response?> getSingleUserData() async {
    String token = prefs.getString(Constants.accessToken).toString();
    log(token);
    try {
      http.Response response = await http.get(Uri.parse(Urls.getSingleUser),
          headers: {'Authorization': 'Bearer $token'});
      log(response.body);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

//user contactUs
  static Future<Response?> contactUs(dynamic body) async {
    try {
      String token = prefs.getString(Constants.accessToken).toString();
      log(token);
      // log("id" + id);
      http.Response response = await http.post(Uri.parse(Urls.contactUs),
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

// Opt it out
  static Future<Response?> optitOut(dynamic body) async {
    try {
      String token = prefs.getString(Constants.accessToken).toString();
      log(token);
      // log("id" + id);
      http.Response response = await http.post(Uri.parse(Urls.optitOut),
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

//support service
  static Future<Response?> getuserSupport() async {
    try {
      String token = prefs.getString(Constants.accessToken).toString();
      log(token);
      // log("id" + id);
      http.Response response = await http.get(Uri.parse(Urls.getuserSupport),
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
