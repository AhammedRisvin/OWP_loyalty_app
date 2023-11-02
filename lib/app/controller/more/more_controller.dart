import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/backend/model/more/support_model.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../backend/services/user_services.dart';

class MoreController extends GetxController implements GetxService {
  TextEditingController complaintController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController optitoutController = TextEditingController();
  RxList<Support> supportModel = <Support>[].obs;

  @override
  void onInit() {
    userSupport();
    super.onInit();
  }

  // contactUs
  void contactUs() async {
    var param = {
      "text": complaintController.text.toString(),
      "title": subjectController.text.toString()
    };
    var response = await UserService.contactUs(param);
    log(response!.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      complaintController.clear();
      Get.back();
      successtoast(
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    } else {
      log(response.body);
      failurtoast(
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    }
    update();
  }

  // opt it out
  void optitOut() async {
    var param = {
      "text": optitoutController.text.toString(),
    };
    var response = await UserService.optitOut(param);
    log(response!.body);
    if (response.statusCode == 201) {
      optitoutController.clear();
      Get.back();
      successtoast(
        title: "Success",
      );
    } else {
      log(response.body);
      failurtoast(
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    }
    update();
  }

//user support
  void userSupport() async {
    var response = await UserService.getuserSupport();
    log("user suppoprt${response!.body}");
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());
      supportModel.clear();
      for (var element in data['data']) {
        Support value = Support.fromJson(element);
        supportModel.add(value);
      }

      log(supportModel.toString());
    } else {
      log(response.body);
      failurtoast(
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    }
    update();
  }

  RxInt loadingPercentage = 0.obs;
  void init(WebViewController webViewController, String url) {
    webViewController
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          loadingPercentage.value = 0;
          update();
        },
        onProgress: (progress) {
          loadingPercentage.value = progress;
          update();
        },
        onPageFinished: (url) {
          loadingPercentage.value = 100;
          update();
        },
      ))
      ..loadRequest(
        Uri.parse(url),
      );
  }
}
