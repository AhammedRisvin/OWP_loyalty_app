import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/token/token_controllert.dart';
import 'package:owp_loyalty/app/controller/wallet/wallet_cotroller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/wallet/transfer_coin.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/user/user_controller.dart';
import '../../wallet/cost_of_coin.dart';
import '../../widgets/common_widgets.dart';

class TierCard extends StatelessWidget {
  final bool home;

  TierCard({
    super.key,
    this.home = true,
  });
  final UserController controller = Get.put(UserController());
  final WalletController walletController = Get.put(WalletController());
  final TokenController tokenController = Get.put(TokenController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: home == true ? 260 : 200,
        ),
        Stack(
          children: [
            Obx(
              () {
                dynamic tierType;
                tierType = controller.singleUser.value.data?.tier.toString();
                return controller.isDataCome.value == true &&
                        walletController.isDataCome.value == true &&
                        tokenController.isDataCome.value == true
                    ? Container(
                        height: 200,
                        // width: context.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(tierType == "Neptune"
                                  ? "assets/images/neptune-tier-card.png"
                                  : tierType == "Saturn"
                                      ? "assets/images/saturn_tier_card.png"
                                      : tierType == "Mars"
                                          ? "assets/images/mars_tier_card.png"
                                          : "assets/images/mercury_tier_card.png")),
                          // gradient: const LinearGradient(colors: [
                          //   Color(0xff000000),
                          //   Color(0xff474747),
                          //   Color(0xff292929)
                          // ]),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Constants.whitColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: 27,
                                                width: 27,
                                                child: Image.asset(
                                                  "assets/images/Owpcoin.png",
                                                  fit: BoxFit.fill,
                                                )),
                                            Constants().sbWd10,

                                            Obx(
                                              () => Text(
                                                textAlign: TextAlign.start,
                                                walletController.walletModal
                                                            .value.data !=
                                                        null
                                                    ? walletController
                                                        .walletModal
                                                        .value
                                                        .data!
                                                        .balance
                                                        .toString()
                                                    : "0",
                                                style: TextStyle(
                                                  fontSize: 16.0.sp,
                                                  fontFamily:
                                                      Constants.fontMulish,
                                                  color: Constants.whitColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            )

                                            // sbHt10,
                                          ],
                                        ),
                                      ),
                                      Constants().sbHt10,
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 26,
                                            width: 26,
                                            child: Image.asset(
                                              "assets/images/owpcToken.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Constants().sbWd10,
                                          //tokens
                                          Obx(
                                            () => Text(
                                              tokenController.tokenModel.value
                                                          .tokens !=
                                                      null
                                                  ? tokenController
                                                      .tokenModel.value.tokens
                                                      .toString()
                                                  : "0",
                                              style: TextStyle(
                                                fontFamily:
                                                    Constants.fontMulish,
                                                fontSize: 17.0.sp,
                                                color: Constants.whitColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Constants().sbHt10,
                                      Obx(
                                        () => Text(
                                          "Worth ${tokenController.tokenModel.value.worth.toString()} coin",
                                          style: TextStyle(
                                              fontFamily: Constants.fontMulish,
                                              fontSize: 12.0.sp,
                                              color: Constants.whitColor,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5),
                                        ),
                                      ),
                                      Constants().sbHt5,
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Obx(
                                        () => Text(
                                          controller.singleUser.value.data !=
                                                  null
                                              ? controller
                                                  .singleUser.value.data!.tier
                                                  .toString()
                                                  .toUpperCase()
                                              : "Tier",
                                          style: TextStyle(
                                            fontSize: 10.0.sp,
                                            fontFamily: Constants.fontMulish,
                                            color: Constants.whitColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Constants().sbHt5,
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                            "assets/images/owp_loyalty-logo.png"),
                                      ),
                                      Constants().sbHt5,
                                      Text(
                                        "BY OWPMF",
                                        style: TextStyle(
                                          fontSize: 8.0.sp,
                                          fontFamily: Constants.fontMulish,
                                          color: Constants.whitColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Constants().sbHt5,
                              Obx(
                                () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        controller.singleUser.value.data != null
                                            ? controller
                                                .singleUser.value.data!.userName
                                                .toString()
                                                .toUpperCase()
                                            : "".toString(),
                                        style: TextStyle(
                                          fontSize: 15.0.sp,
                                          fontFamily: Constants.fontMulish,
                                          color: Constants.whitColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // controller.singleUser.value.data != null
                                      //     ? controller.singleUser.value.data!
                                      //         .communityId!
                                      //         .toString()
                                      // :
                                      "wallet address",
                                      style: TextStyle(
                                        fontSize: 15.0.sp,
                                        color: Constants.whitColor,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Constants().sbHt5
                            ],
                          ),
                        ),
                      )
                    : Shimmer.fromColors(
                        baseColor: Constants.greyColor,
                        highlightColor: Colors.grey.shade500,
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Constants.greyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
              },
            )
          ],
        ),
        home == true
            ? Padding(
                padding: const EdgeInsets.only(left: 6.0, right: 6, top: 175),
                child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.whitColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Get.to(const CostOfCoinScreen()),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 22,
                                      width: 23,
                                      child: Image.asset(
                                          "assets/images/wallet.png",
                                          color: Colors.grey.shade900)),
                                  Text(
                                    "Recharge Wallet",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      fontFamily: Constants.fontMulish,
                                      color: Constants.blackColor,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ]),
                          ),
                          const VerticalDivider(
                            thickness: 1.8,
                          ),
                          InkWell(
                            onTap: () => Get.to(const TransferCoinScreen()),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 23,
                                      width: 24,
                                      child: Image.asset(
                                        "assets/images/transfere-coin-removebg-preview.png",
                                        fit: BoxFit.fill,
                                      )),
                                  Text(
                                    "Transfer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      fontFamily: Constants.fontMulish,
                                      color: Constants.blackColor,
                                      height: 1.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ]),
                          ),
                          const VerticalDivider(
                            thickness: 1.8,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                child: Image.asset(
                                                  "assets/images/owpcToken.png",
                                                  height: 50,
                                                ),
                                              ),
                                              Constants().sbWd10,
                                              Obx(
                                                () => Text(
                                                  tokenController.tokenModel
                                                              .value.tokens !=
                                                          null
                                                      ? tokenController
                                                          .tokenModel
                                                          .value
                                                          .tokens
                                                          .toString()
                                                      : "0",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.fontMulish,
                                                    fontSize: 18.0.sp,
                                                    color: Constants.blackColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Constants().sbHt20,
                                          Obx(
                                            () => Text(
                                              textAlign: TextAlign.center,
                                              "Your token  worth is ${tokenController.tokenModel.value.worth.toString()} coins",
                                              style: TextStyle(
                                                  fontFamily:
                                                      Constants.fontMulish,
                                                  fontSize: 14.0.sp,
                                                  color: Constants.blackColor,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.5),
                                            ),
                                          ),
                                          Constants().sbHt20,
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Are you sure to convert tokens to coins?",
                                            style: TextStyle(
                                              fontFamily: Constants.fontMulish,
                                              fontSize: 14.0.sp,
                                              color: Constants.lightMainColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text('Cancel',
                                              style: customTextStyle(
                                                  color: Constants.buttonColor,
                                                  size: 12.0.sp,
                                                  weight: FontWeight.w400)),
                                        ),
                                        commonRectangleButton(
                                            context: context,
                                            action: () {
                                              tokenController
                                                  .convertTokenToCoin();
                                            },
                                            title: 'Confirm'),
                                      ],
                                    );
                                  });
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/token_convert.png",
                                    fit: BoxFit.fill,
                                    height: 23,
                                    width: 28,
                                  ),
                                  Text(
                                    "Convert to coin",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10.0.sp,
                                      height: 1.5,
                                      fontFamily: Constants.fontMulish,
                                      color: Constants.blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    )),
              )
            : const SizedBox(),
      ],
    );
  }
}
