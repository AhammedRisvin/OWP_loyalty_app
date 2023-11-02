import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';

import '../../../controller/token/token_controllert.dart';
import '../../../utils/constants.dart';

class ConvertTokenToCoinScreen extends StatelessWidget {
  const ConvertTokenToCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TokenController tokenController = Get.put(TokenController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  tokenController.tokenModel.value.tokens != null
                      ? tokenController.tokenModel.value.tokens.toString()
                      : "0",
                  style: TextStyle(
                    fontFamily: Constants.fontMulish,
                    fontSize: 18.0.sp,
                    color: Constants.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Constants().sbHt10,
          Obx(
            () => Text(
              "Your token  worth is ${tokenController.tokenModel.value.worth.toString()} coins",
              style: TextStyle(
                  fontFamily: Constants.fontMulish,
                  fontSize: 20.0.sp,
                  color: Constants.blackColor,
                  fontWeight: FontWeight.w700,
                  height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
