import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/constants.dart';
import '../../utils/prefference.dart';
import '../../utils/urls.dart';

class WhatsNewServices {
  static Future<Response?> getWhatsNewOffers() async {
    String token = prefs.getString(Constants.accessToken).toString();
    log(token);
    try {
      http.Response response = await http.get(Uri.parse(Urls.getWhatsNew),
          headers: {'Authorization': 'Bearer $token'});
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
