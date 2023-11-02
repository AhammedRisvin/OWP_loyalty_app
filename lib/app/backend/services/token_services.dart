import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/constants.dart';
import '../../utils/prefference.dart';
import '../../utils/urls.dart';

class TokenService {
  static Future<Response?> getToken() async {
    String token = prefs.getString(Constants.accessToken).toString();
    log(token);
    try {
      http.Response response = await http.get(Uri.parse(Urls.getToken),
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Response?> convertTokenToCoin() async {
    String token = prefs.getString(Constants.accessToken).toString();
    log(token);
    try {
      http.Response response = await http.get(
          Uri.parse(Urls.convertTokenToCoin),
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
