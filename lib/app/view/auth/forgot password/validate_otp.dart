// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:owp_loyalty/app/controller/auth/forgotpassword_controller.dart';
// import 'package:owp_loyalty/app/utils/constants.dart';
// import 'package:owp_loyalty/app/utils/size_config.dart';

// import '../../widgets/common_widgets.dart';

// class CreateNewPasswordAndValidateOtp extends StatelessWidget {
//   const CreateNewPasswordAndValidateOtp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ForgotPasswordController controller =
//         Get.put(ForgotPasswordController());
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: Column(children: [
//               Constants().sbHt30,
//               Constants().sbHt30,
//               Row(
//                 children: [
//                   const BackButtonWidget(),
//                   Text("  Create password",
//                       style: customTextStyle(
//                           color: Constants.mainColor,
//                           size: 15.0.sp,
//                           weight: FontWeight.w500)),
//                 ],
//               ),
//               Constants().sbHt50,
//               TextField(
//                 controller: controller.otpTextEditor,
//                 decoration: const InputDecoration(
//                   label: Text("OTP"),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               Constants().sbHt20,
//               TextField(
//                 controller: controller.passwordTextEditor,
//                 decoration: const InputDecoration(
//                   label: Text("NewPassword"),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               Constants().sbHt50,
//               CommonButtonWidget(
//                   btnName: "Confirm",
//                   function: () => controller.otpResetPasswordVerify())
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
