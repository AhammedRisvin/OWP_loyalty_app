import 'package:flutter/material.dart';

// extension GenderExtension on Gender {
//   Rx<Gender> get rx => this.obs;
// }

class Constants {
//App FOnts
  static const String fontMulish = "Mulish";
//prefe keys
  static const String accessToken = "accessToken";
  static const String clientSecret = "clientSecret";
  static const String transactionId = "transactionId";
  static const String selectedCountry = "selectedCountry";
//

//App colors
  final MaterialColor primaryColor =
      const MaterialColor(0xff010336, <int, Color>{
    50: Color(0xff010336),
    100: Color(0xff010336),
    200: Color(0xff010336),
    300: Color(0xff010336),
    400: Color(0xff010336),
    500: Color(0xff010336),
    600: Color(0xff010336),
    700: Color(0xff010336),
    800: Color(0xff010336),
    900: Color(0xff010336),
  });

  static const mainColor = Color.fromARGB(255, 3, 6, 73);
  static const lightMainColor = Color.fromARGB(255, 48, 50, 114);
  // static const lightMainColor = Color(0xff485272);
  static const mainYellowColor = Color(0xffF1D448);
  static const owppMainColor = Color(0xff2cb94e);
  static const owppBackgroundBlColor = Color(0xff080A23);
  static const whitColor = Color(0xffFFFFFF);
  static const blackColor = Color(0xff2C2B2B);
  static const greyColor = Color(0xffD9D9D9);
  static const ligtgreyColor = Color.fromARGB(255, 177, 176, 176);
  static const darkgreyColor = Color.fromARGB(255, 104, 103, 103);
  static const ligBlueColor = Color(0xffAEBAE4);
  static const Color buttonColor = Color(0xff1b4e9f);
  static const Color toastRedColor = Colors.red;
  static const Color toastGreenColor = Colors.greenAccent;
  static Color textligtMainColor = Colors.grey.shade600;

// Height and Width
  SizedBox sbHt5 = const SizedBox(height: 5);
  SizedBox sbHt10 = const SizedBox(height: 10);
  SizedBox sbHt20 = const SizedBox(height: 20);
  SizedBox sbHt30 = const SizedBox(height: 30);
  SizedBox sbHt40 = const SizedBox(height: 40);
  SizedBox sbHt50 = const SizedBox(height: 50);
  SizedBox sbHt100 = const SizedBox(
    height: 100,
  );
  SizedBox sbWd10 = const SizedBox(width: 10);
  SizedBox sbWd20 = const SizedBox(width: 20);
  SizedBox sbWd30 = const SizedBox(width: 30);
  SizedBox sbWd40 = const SizedBox(width: 40);
  SizedBox sbWd100 = const SizedBox(
    width: 100,
  );
  SizedBox sbWd5 = const SizedBox(
    width: 5,
  );
}
