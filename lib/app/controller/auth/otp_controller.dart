// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:owp_loyalty/app/backend/services/auth_services.dart';
// import 'package:owp_loyalty/app/view/skeleton/skeleton_screen.dart';
// import '../../utils/prefference.dart';
// import '../../view/widgets/common_widgets.dart';

// class OtpController extends GetxController implements GetxService {
//   TextEditingController otpController = TextEditingController();
//   TextEditingController resetPasswordOtpController = TextEditingController();
//   TextEditingController resetPasswordController = TextEditingController();
//   TextEditingController confiermResetPasswordController =
//       TextEditingController();

// //otpEmailVerification function
//   void otpEmailVerification() async {
//     Map data = {
//       "email": prefs.getString("userEmail").toString(),
//       "otp": otpController.text
//     };
//     log('-ssssss---$data');
//     showLoading();
//     var response = await AuthServices.otpEmailVerify(data: data);
//     log(response!.statusCode.toString());
//     log(response.body.toString());
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       otpController.clear();
//       Map<String, dynamic> data = jsonDecode(response.body.toString());
//       String? accessToken = data['data']['access_token'];
//       if (accessToken != null) {
//         prefs.setString("accessToken", accessToken);
//         log("accessToken: $accessToken");
//       } else {
//         log("Access token is null");
//       }
//       hideLoading();
//       Get.offAll(const SkeletonScreen());
//       successtoast(title: "Account verified");
//     } else {
//       var data = json.decode(response.body);
//       hideLoading();
//       log(data["data"]["message"].toString());
//       failurtoast(
//         title: data["data"]["message"].toString(),
//       );
//     }
//     update();
//   }
// }
