import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:owp_loyalty/app/backend/services/owps_services.dart';

class OwpSweatController extends GetxController {
  RxInt todayStepCount = 0.obs;
  @override
  void onInit() {
    getMyTodaySteps();
    super.onInit();
  }

//get user step count data
  void getMyTodaySteps() async {
    var response = await OwpSweatServices.getMyTodaySteps();

    if (response!.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body.toString());

      todayStepCount.value = data['data']['steps'];
    } else {
      log("tokenodel${response.body}");
    }
    update();
  }
}
