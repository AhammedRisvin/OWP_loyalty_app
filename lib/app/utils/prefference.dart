import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
Future<void> getPrefs() async {
  prefs = await SharedPreferences.getInstance();
}
