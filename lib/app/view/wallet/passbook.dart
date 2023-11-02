// import 'package:loyalty/view/home/widgets/categories.dart';
// import 'package:loyalty/view/home/widgets/recommended.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/wallet/wallet_cotroller.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/wallet/widgets/redeem_passbook_item.dart';

import '../../utils/constants.dart';
import '../widgets/common_widgets.dart';
import 'widgets/custom_button.dart';
import 'widgets/passbook_item.dart';

class PassBookScreen extends StatelessWidget {
  final bool bottom;
  const PassBookScreen({super.key, this.bottom = false});

  @override
  Widget build(BuildContext context) {
    WalletController controller = Get.put(WalletController());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Constants().sbHt50,
          Row(
            children: [
              bottom == false ? const BackButtonWidget() : const SizedBox(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Passbook",
                    style: customTextStyle(
                        color: Constants.mainColor,
                        size: 15.0.sp,
                        weight: FontWeight.w500)),
              )
            ],
          ),
          Constants().sbHt20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomPassbookButton(
                name: "3 Months",
                function: () {
                  controller.getPassbook(3);
                },
              ),
              CustomPassbookButton(
                name: "6 Months",
                function: () {
                  controller.getPassbook(6);
                },
              ),
              CustomPassbookButton(
                name: "9 Months",
                function: () {
                  controller.getPassbook(9);
                },
              ),
            ],
          ),
          Constants().sbHt10,
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.getMyRedeemScreen(value: false);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Constants.mainColor,
                    backgroundColor: controller.isMyRedeems.value == false
                        ? Constants.mainColor
                        : Constants.whitColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Transactions",
                    style: customTextStyle(
                      size: 13,
                      weight: FontWeight.w600,
                      color: controller.isMyRedeems.value == false
                          ? Constants.whitColor
                          : Constants.blackColor,
                    ),
                  ),
                ),
                Constants().sbWd10,
                OutlinedButton(
                  onPressed: () {
                    controller.getMyRedeemScreen(value: true);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Constants.mainColor,
                    backgroundColor: controller.isMyRedeems.value == false
                        ? Constants.whitColor
                        : Constants.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "My Redeems",
                    style: customTextStyle(
                      size: 13,
                      weight: FontWeight.w600,
                      color: controller.isMyRedeems.value == false
                          ? Constants.mainColor
                          : Constants.whitColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Constants().sbHt10,
          Obx(
            () => Flexible(
              child: controller.getPassbookDetails.isEmpty
                  ? Center(
                      child: Image.asset(
                        "assets/images/no-data.png",
                        height: 100,
                      ),
                    )
                  : controller.isMyRedeems.value == false
                      ? ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              Constants().sbWd20,
                          itemCount: controller.getPassbookDetails.length,
                          itemBuilder: (context, index) {
                            var details = controller.getPassbookDetails[index];
                            return PassBookItem(
                              details: details,
                            );
                          },
                        )
                      : controller.getMyRedeemDetails.isEmpty
                          ? Center(
                              child: Image.asset(
                                "assets/images/no-data.png",
                                height: 100,
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Constants().sbWd20,
                              itemCount: controller.getMyRedeemDetails.length,
                              itemBuilder: (context, index) {
                                var details =
                                    controller.getMyRedeemDetails[index];
                                return RedeemPassBookItem(
                                  details: details,
                                );
                              },
                            ),
            ),
          ),
        ]),
      ),
    ));
  }
}
