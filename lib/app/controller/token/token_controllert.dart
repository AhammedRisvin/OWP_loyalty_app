import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:owp_loyalty/app/backend/model/token/token_model.dart';
import 'package:owp_loyalty/app/backend/services/token_services.dart';
import 'package:owp_loyalty/app/controller/tier/tier_controller.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../wallet/wallet_cotroller.dart';

class TokenController extends GetxController implements GetxService {
  var tokenModel = TokenModal().obs;
  RxBool isDataCome = false.obs;
  @override
  void onInit() {
    getToken();
    super.onInit();
  }

//get user Token data
  void getToken() async {
    var response = await TokenService.getToken();

    if (response!.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body.toString());

      tokenModel.value = TokenModal.fromJson(data['data']);
      isDataCome.value = true;
    } else {
      log("tokenodel${response.body}");
    }
    update();
  }

//Convert token to coin
  void convertTokenToCoin() async {
    var response = await TokenService.convertTokenToCoin();

    if (response!.statusCode >= 200 && response.statusCode <= 299) {
      getToken();
      Get.put(WalletController()).getWallet();
      Get.put(WalletController()).getPassbook(3);
      getTokensForNextTierUpdation();
      Get.back();
      successtoast(
        title: json.decode(response.body)["data"]["message"].toString(),
      );
      update();
    } else {
      log(response.body);
      failurtoast(
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    }
    update();
  }

  void getTokensForNextTierUpdation() {
    Get.find<TierController>().getTokensForNexTier();
    update();
  }
}
