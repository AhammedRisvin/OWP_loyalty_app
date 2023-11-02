import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/token/token_controllert.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/wallet/passbook.dart';

import '../../controller/wallet/wallet_cotroller.dart';
import '../widgets/common_widgets.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final WalletController controller = Get.put(WalletController());
  final TokenController tokenController = Get.put(TokenController());
  Map<String, dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Constants().sbHt40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const BackButtonWidget(),
                      Text("  Recharge wallet",
                          style: customTextStyle(
                              color: Constants.mainColor,
                              size: 15.0.sp,
                              weight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              Constants().sbHt30,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      width: context.width,
                      foregroundDecoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      height: 18.hp,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color(0xff000000),
                            Color(0xff474747),
                            Color(0xff292929)
                          ]),
                          // color: Colors.black,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Constants().sbWd40,
                            Constants().sbWd40,
                            Constants().sbWd40,
                            Text(
                              "My Earning",
                              style: customTextStyle(
                                  color: Constants.whitColor,
                                  size: 12.sp,
                                  weight: FontWeight.w600),
                            ),
                            Constants().sbHt5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Image.asset(
                                      "assets/images/Owpcoin.png",
                                    )),
                                Constants().sbWd20,
                                Obx(
                                  () => Text(
                                    textAlign: TextAlign.start,
                                    controller.walletModal.value.data != null
                                        ? controller
                                            .walletModal.value.data!.balance
                                            .toString()
                                        : "0",
                                    style: TextStyle(
                                      fontSize: 16.0.sp,
                                      fontFamily: Constants.fontMulish,
                                      color: Constants.whitColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Constants().sbHt5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Image.asset(
                                      "assets/images/owpcToken.png",
                                    )),
                                Constants().sbWd20,
                                Obx(
                                  () => Text(
                                    tokenController.tokenModel.value.tokens !=
                                            null
                                        ? tokenController
                                            .tokenModel.value.tokens
                                            .toString()
                                        : "0",
                                    style: TextStyle(
                                      fontFamily: Constants.fontMulish,
                                      fontSize: 17.0.sp,
                                      color: Constants.whitColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Constants().sbHt30,
                    InkWell(
                      onTap: () async {
                        await controller.makePayment(context, "100", "INR");
                        // makePaymentStripe("100", "INR");
                      },
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Constants.mainColor,
                            borderRadius: BorderRadius.circular(10),
                            // boxShadow: const [
                            //   BoxShadow(
                            //       color: Colors.black54,
                            //       blurRadius: 5.0,
                            //       offset: Offset(0.0, 0.75))
                            // ],
                          ),
                          child: Center(
                              child: Text("Proceed to buy",
                                  style: customTextStyle(
                                      color: Constants.whitColor,
                                      size: 13.sp,
                                      weight: FontWeight.w600)))),
                    ),
                    Constants().sbHt30,
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PassBookScreen(),
                      )),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Constants.greyColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.note,
                                color: Constants.mainColor,
                                size: 50,
                              ),
                              Constants().sbWd10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Passbook",
                                      textAlign: TextAlign.center,
                                      style: customTextStyle(
                                        color: Constants.mainColor,
                                        size: 12.0.sp,
                                        weight: FontWeight.w500,
                                      )),
                                  SizedBox(
                                    width: 50.wp,
                                    child: Text(
                                        "Your transaction history of wallet",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: customTextStyle(
                                            color: Constants.mainColor,
                                            size: 10.0.sp,
                                            weight: FontWeight.w400)),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //         height: 26,
              //         width: 20,
              //         child: Image.asset(
              //           "assets/images/bitcoin.png",
              //         )),
              //     Constants().sbWd10,
              //     Obx(() => controller.walletModal.value.data != null
              //         ? Text(
              //             controller.walletModal.value.data!.balance != null
              //                 ? controller.walletModal.value.data!.balance
              //                     .toString()
              //                 : "0",
              //             style: customTextStyle(
              //                 color: Constants.mainColor,
              //                 size: 15.sp,
              //                 weight: FontWeight.w600))
              //         : Text("",
              //             style: customTextStyle(
              //                 color: Constants.mainColor,
              //                 size: 15.sp,
              //                 weight: FontWeight.w600))),
              //   ],
            ],
          ),
        ),
      ),
    );
  }
}
