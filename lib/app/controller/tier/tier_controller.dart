import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/user/user_controller.dart';
import 'package:owp_loyalty/app/controller/wallet/wallet_cotroller.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../backend/model/tier/get_tiers_model.dart';
import '../../backend/services/tier_services.dart';
import '../../view/widgets/success.dart';

class TierController extends GetxController implements GetxService {
  RxList<TiersModel> getAllTierList = <TiersModel>[].obs;
  RxList<String> neptuneBenefitList = <String>[].obs;
  RxList<String> saturBenefitList = <String>[].obs;
  RxList<String> marsBenefitList = <String>[].obs;
  RxList<String> mercuryBenefitList = <String>[].obs;
  TiersModel? currentTierModal;
  RxInt tierChangeValue = 0.obs;
  RxDouble tierBarValue = 0.1.obs;
  Rx currentTier = "Neptune".obs;
  RxInt getTokensForNexTierUpdation = 0.obs;
  @override
  void onInit() {
    getTiers();
    tierBarChange();
    // getCurrentTierDetails();
    getTokensForNexTier();
    super.onInit();
  }

//tier bar on change function
  void tierBarChange() {
    String tierType = "";
    if (Get.put(UserController()).singleUser.value.data != null) {
      tierType =
          Get.put(UserController()).singleUser.value.data!.tier.toString();
    }

    if (tierType == "Neptune") {
      tierBarValue.value = 0.1;
      tierChangeValue.value = 0;
    } else if (tierType == "Saturn") {
      tierBarValue.value = 0.35;
      tierChangeValue.value = 1;
    } else if (tierType == "Mars") {
      tierBarValue.value = 0.6;
      tierChangeValue.value = 2;
    } else if (tierType == "Mercury") {
      tierBarValue.value = 0.95;
      tierChangeValue.value = 3;
    }

    update();
  }

//tier change
  void tierChange(int value) {
    tierChangeValue.value = value;
    update();
  }

//get current tier details
  void getCurrentTierDetails() {
    getCurrentTier();
    if (currentTier.value == "Neptune") {
      currentTierModal = getAllTierList[0];
      update();
    } else if (currentTier.value == "Saturn") {
      currentTierModal = getAllTierList[1];
      update();
    } else if (currentTier.value == "Mars") {
      currentTierModal = getAllTierList[2];
      // log("goldcurrent" + currentTierModal!.name.toString());
      update();
    } else if (currentTier.value == "Mercury") {
      currentTierModal = getAllTierList[3];
      update();
    }
    update();
  }

  void getCurrentTier() {
    if (Get.put(UserController()).singleUser.value.data != null) {
      currentTier.value =
          Get.put(UserController()).singleUser.value.data!.tier.toString();
    }

    update();
  }

//get getTiers
  void getTiers() async {
    var response = await TierServices.getAllTiers();
    if (response!.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      getAllTierList.clear();
      for (var item in data['data']) {
        TiersModel data = TiersModel.fromJson(item);
        getAllTierList.add(data);
      }

      neptuneBenefitList.clear();
      saturBenefitList.clear();
      marsBenefitList.clear();
      mercuryBenefitList.clear();
      for (var element in getAllTierList) {
        if (element.name == "Neptune") {
          Map<String, dynamic> productMap = element.toJson();
          productMap.remove("status");
          productMap.forEach((key, value) {
            if (value == true) {
              List<String> parts = key.split('_');
              String result = parts.join(' ');
              neptuneBenefitList.add(result);
            } else if (key == "tokens_on_spend") {
              neptuneBenefitList
                  .add("OWPT Gain: ${value.toString()} per \$ Spent");
            }
          });
        } else if (element.name == "Saturn") {
          Map<String, dynamic> productMap = element.toJson();
          productMap.remove("status");
          productMap.forEach((key, value) {
            if (value == true) {
              List<String> parts = key.split('_');
              String result = parts.join(' ');
              saturBenefitList.add(result);
            } else if (key == "tokens_on_spend") {
              saturBenefitList
                  .add("OWPT Gain: ${value.toString()} per \$ Spent");
            }
          });
        } else if (element.name == "Mars") {
          Map<String, dynamic> productMap = element.toJson();
          productMap.remove("status");
          productMap.forEach((key, value) {
            if (value == true) {
              List<String> parts = key.split('_');
              String result = parts.join(' ');
              marsBenefitList.add(result);
            } else if (key == "tokens_on_spend") {
              marsBenefitList
                  .add("OWPT Gain: ${value.toString()} per \$ Spent");
            }
          });
        } else if (element.name == "Mercury") {
          Map<String, dynamic> productMap = element.toJson();
          productMap.remove("status");
          productMap.forEach((key, value) {
            if (value == true) {
              List<String> parts = key.split('_');
              String result = parts.join(' ');
              mercuryBenefitList.add(result);
            } else if (key == "tokens_on_spend") {
              mercuryBenefitList
                  .add("OWPT Gain: ${value.toString()} per \$ Spent");
            }
          });
        }
      }
    } else {
      log(response.body);
    }
    update();
  }

//purchase tier
  void tierPurchase() async {
    String? id;
    if (tierChangeValue.value == 0) {
      id = getAllTierList[1].id.toString();
      update();
    } else if (tierChangeValue.value == 1) {
      id = getAllTierList[2].id.toString();
      update();
    } else if (tierChangeValue.value == 2) {
      id = getAllTierList[3].id.toString();
      update();
    }
    var params = {'id': id};
    log("params $params");
    var response = await TierServices.purchaseTier(params);
    log(response!.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      log(response.statusCode.toString());
      getTiers();
      tierBarChange();
      getCurrentTierDetails();
      getWallet();
      Get.put(WalletController()).getPassbook(3);
      Get.to(const SuccessScreen());
      update();
    } else {
      Get.back();
      log(response.body);
      failurtoast(
        title: json.decode(response.body)["data"]["message"].toString(),
      );
    }
    update();
  }

//getTokensForNexTier
  void getTokensForNexTier() async {
    var response = await TierServices.getTokensForNexTier();
    log(response!.body);
    log(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());

      getTokensForNexTierUpdation.value = data["data"]["tokens_required"];
      log("getTokensForNexTierUpdation${getTokensForNexTierUpdation.value.toString()}");
      update();
    } else {
      log(response.body);
    }
    update();
  }

  void getWallet() {
    Get.find<WalletController>().getWallet();
    update();
  }
}
