import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/wallet/wallet.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../controller/wallet/wallet_cotroller.dart';

class CostOfCoinScreen extends StatelessWidget {
  const CostOfCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController controller = Get.put(WalletController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.width,
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Constants().sbHt20,
                    controller.isCostZero.value == true
                        ? const BackButtonWidget()
                        : const SizedBox(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Constants().sbHt50,
                        Constants().sbHt10,
                        SizedBox(
                          child: Image.asset(
                            "assets/images/Owpcoin.png",
                            height: 100,
                          ),
                        ),
                        Constants().sbHt10,
                        Text(
                          "GET MORE COINS!", //How many coins do you want?
                          style: customTextStyle(
                              color: Constants.blackColor,
                              size: 14.sp,
                              weight: FontWeight.w600),
                        ),
                        Constants().sbHt30,
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomTextFieldWidget(
                              label: "How many coins do you want?",
                              controller: controller.numberOfCoinController,
                              keybordType: TextInputType.number),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CommonButtonWidget(
                              btnName: "Confirm",
                              function: () {
                                controller.getCoinCost();
                              }),
                        ),
                        // Constants().sbHt5,
                        controller.isCostZero.value == true
                            ? const SizedBox()
                            : SizedBox(
                                width: 90.wp,
                                height: 12.hp,
                                child: Card(
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 2,
                                  color: const Color(0xff52aaff),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "You Pay",
                                          style: customTextStyle(
                                              color: Constants.whitColor,
                                              size: 14.sp,
                                              weight: FontWeight.w500),
                                        ),
                                        Constants().sbHt5,
                                        Obx(
                                          () => Text(
                                            "\$${controller.cost.toString()}",
                                            style: customTextStyle(
                                                color: Constants.whitColor,
                                                size: 14.sp,
                                                weight: FontWeight.w800),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        // Constants().sbHt5,
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            controller.isCostZero.value == true
                                ? const SizedBox()
                                : commonRectangleButton(
                                    context: context,
                                    action: () {
                                      controller.numberOfCoinController.clear();
                                      controller.isCostZero.value = true;
                                      Get.back();
                                    },
                                    title: "Cancel"),
                            controller.isCostZero.value == true
                                ? const SizedBox()
                                : commonRectangleButton(
                                    context: context,
                                    action: () {
                                      Get.to(const WalletScreen());
                                    },
                                    title: "Continue")
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
