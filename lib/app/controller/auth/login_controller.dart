import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/view/skeleton/skeleton_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/services/auth_services.dart';
import '../../utils/prefference.dart';
import '../../view/widgets/common_widgets.dart';

class LoginController extends GetxController implements GetxService {
  final emailTextEditor = TextEditingController();
  final passwordTextEditor = TextEditingController();
  RxBool passwordVisible = true.obs;

  @override
  void onInit() {
    debugPrint('api call');
    super.onInit();
    emailTextEditor.text = '';
    passwordTextEditor.text = '';
  }

  Future onLogin() async {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (emailTextEditor.text.isEmpty || passwordTextEditor.text.isEmpty) {
      failurtoast(title: "Please enter all fields");
    } else if (!emailRegex.hasMatch(emailTextEditor.text)) {
      failurtoast(
        title: "Email not valid",
      );
    } else {
      Map data = {
        "email": emailTextEditor.text,
        "password": passwordTextEditor.text,
      };
      log('-ssssss---$data');
      showLoading();
      var response = await AuthServices.getlogInService(data: data);

      log(response!.body.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> data = jsonDecode(response.body.toString());
        String? accessToken = data['data']['access_token'];
        if (accessToken != null) {
          prefs.setString("accessToken", accessToken);
          log("accessToken: $accessToken");
        } else {
          log("Access token is null");
        }
        String fcmToken = prefs.getString("fcmToken").toString();
        var param = {"fcm": fcmToken};
        var res = await AuthServices.postFcmToken(data: param);
        log("fcm${res!.body}");
        emailTextEditor.clear();
        passwordTextEditor.clear();
        prefs.setBool("isSignedIn", true);
        prefs.setString("userEmail", emailTextEditor.text);
        hideLoading();
        successtoast(
          title: "Loged Successfully",
        );
        Get.offAll(const SkeletonScreen());
      } else {
        hideLoading();
        failurtoast(
          duration: 3,
          title: json.decode(response.body)["data"]["message"].toString(),
        );
        log(response.body.toString());
      }
    }
    update();
  }

//user already signedin
  RxBool isSignedIn = false.obs;
  Future<void> alreadySigned() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedUser = sharedPreferences.getBool("isSignedIn");
    isSignedIn.value = obtainedUser ?? false;
    update();
  }

  void togglePasswordBtn() {
    passwordVisible.value = !passwordVisible.value;
    update();
  }
}
