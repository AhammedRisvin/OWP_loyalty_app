import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';

import '../../../controller/user/user_controller.dart';
import '../../../controller/wallet/wallet_cotroller.dart';
import '../../../utils/constants.dart';
import '../../widgets/common_widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());
    final WalletController walletController = Get.put(WalletController());
    return Column(
      children: [
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.updateProfileImage(true);
                          },
                          child: Obx(
                            () => ClipOval(
                              child: CircleAvatar(
                                  backgroundColor: Constants.whitColor,
                                  radius: 50,
                                  child: controller.image.value != null
                                      ? Image.file(
                                          controller.image.value!,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          "assets/images/man.png",
                                          fit: BoxFit.fill,
                                        )),
                            ),
                          ),
                        ),
                        Constants().sbWd20,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.singleUser.value.data!.userName != null
                                  ? controller.singleUser.value.data!.userName
                                      .toString()
                                  : "",
                              style: customTextStyle(
                                  color: Constants.mainColor,
                                  size: 20.sp,
                                  weight: FontWeight.w700),
                            ),
                            Constants().sbHt5,
                            Text(
                              "wallet address",
                              style: customTextStyle(
                                  color: Constants.mainColor,
                                  size: 14.sp,
                                  weight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Constants().sbHt30,
                  controller.singleUser.value.data!.email != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.call_outlined,
                                size: 18,
                                color: Constants.textligtMainColor,
                              ),
                              Constants().sbWd20,
                              Text(
                                controller.singleUser.value.data!.email
                                    .toString(),
                                style: customTextStyle(
                                    color: Constants.textligtMainColor,
                                    size: 12.sp,
                                    weight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  Constants().sbHt10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 18,
                          color: Constants.textligtMainColor,
                        ),
                        Constants().sbWd20,
                        Text(
                          controller.singleUser.value.data!.email.toString(),
                          style: customTextStyle(
                              color: Constants.textligtMainColor,
                              size: 12.sp,
                              weight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Constants().sbHt10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 16,
                            width: 16,
                            child: Image.asset("assets/images/wallet.png",
                                color: Constants.mainColor)),
                        Constants().sbWd5,
                        Text(
                          "id :",
                          style: customTextStyle(
                              color: Constants.mainColor,
                              size: 13.sp,
                              weight: FontWeight.w600),
                        ),
                        Constants().sbWd20,
                        SelectableText(
                          controller.singleUser.value.data!.id.toString(),
                          style: customTextStyle(
                              color: Constants.mainColor,
                              size: 13.sp,
                              weight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Constants().sbHt10,
                ],
              ),
            ),
          ),
        ),
        Constants().sbHt10,
        Row(
          children: [
            Container(
              width: 50.wp,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Constants.greyColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.singleUser.value.data!.tier
                        .toString()
                        .toUpperCase(),
                    style: customTextStyle(
                        color: Constants.mainColor,
                        size: 16.sp,
                        weight: FontWeight.w600),
                  ),
                  Constants().sbHt5,
                  Text(
                    "Tier",
                    style: customTextStyle(
                        color: Constants.textligtMainColor,
                        size: 12.sp,
                        weight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Container(
              width: 50.wp,
              height: 80,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Constants.greyColor),
                      top: BorderSide(color: Constants.greyColor))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 18,
                          width: 18,
                          child: Image.asset(
                            "assets/images/Owpcoin.png",
                            fit: BoxFit.fill,
                          )),
                      Constants().sbWd5,
                      Obx(
                        () => Text(
                          walletController.walletModal.value.data != null
                              ? walletController.walletModal.value.data!.balance
                                  .toString()
                              : "",
                          style: customTextStyle(
                              color: Constants.mainColor,
                              size: 16.sp,
                              weight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Constants().sbHt5,
                  Text(
                    "Wallet",
                    style: customTextStyle(
                        color: Constants.textligtMainColor,
                        size: 12.sp,
                        weight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
