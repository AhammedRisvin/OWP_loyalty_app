import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/widgets/bottom_bar.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () => Get.off(const BottomBar()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Constants().sbHt20,
        Image.asset("assets/images/check-circle.png"),
        Constants().sbHt20,
        Text(
          "Your Tier has been Upgraded",
          style: customTextStyle(
              color: Constants.whitColor, size: 18.sp, weight: FontWeight.w600),
        ),
        Image.asset(
          "assets/images/success-bg.png",
          fit: BoxFit.fill,
          height: 50.hp,
          width: context.width,
        )
      ]),
    );
  }
}
