import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/auth/Login/login.dart';

import '../../utils/constants.dart';
import '../../utils/prefference.dart';
import 'common_widgets.dart';

Future<void> showCategoryAdd(
    {required BuildContext context, required String text}) async {
//pop up-
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            text,
            style: customTextStyle(
                color: Constants.blackColor,
                size: 13.0.sp,
                weight: FontWeight.w400),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
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
                  prefs.setBool("isSignedIn", false);
                  prefs.setString("accessToken", "value");
                  Get.offAll(const LogInScreen());
                },
                title: 'Confirm'),
          ],
        );
      });
}
