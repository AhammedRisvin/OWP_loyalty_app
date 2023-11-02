import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/backend/services/auth_services.dart';
import 'package:owp_loyalty/app/view/auth/Login/login.dart';

import '../../view/widgets/common_widgets.dart';

class ForgotPasswordController extends GetxController implements GetxService {
  final emailTextEditor = TextEditingController();
  final oldPasswordTextEditor = TextEditingController();
  final newPasswordTextEditor = TextEditingController();

//send email
  Future forgotPasswordUser({required bool isLoged}) async {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

    if (emailTextEditor.text.isEmpty ||
        oldPasswordTextEditor.text.isEmpty ||
        newPasswordTextEditor.text.isEmpty) {
      failurtoast(title: "Please fill all field");
    } else if (!emailRegex.hasMatch(emailTextEditor.text)) {
      failurtoast(title: "Email not valid");
    } else {
      var params = {
        "email": emailTextEditor.text,
        "newPassword": newPasswordTextEditor.text,
        "oldPassword": oldPasswordTextEditor.text
      };
      showLoading();
      var response = await AuthServices.getForgotPasswordService(body: params);

      log(response!.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        emailTextEditor.clear();
        newPasswordTextEditor.clear();
        oldPasswordTextEditor.clear();
        hideLoading();
        if (isLoged == false) {
          Get.off(const LogInScreen());
        } else {
          Get.back();
        }

        successtoast(title: "Your password has been updated");
      } else {
        hideLoading();
        failurtoast(
          title: json.decode(response.body)["data"]["message"].toString(),
        );
      }
    }
    update();
  }
}
