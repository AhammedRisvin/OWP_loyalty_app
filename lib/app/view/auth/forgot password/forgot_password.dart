// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:owp_loyalty/app/controller/auth/forgotpassword_controller.dart';
// import 'package:owp_loyalty/app/utils/constants.dart';
// import 'package:owp_loyalty/app/utils/size_config.dart';

// import '../../widgets/common_widgets.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ForgotPasswordController controller =
//         Get.put(ForgotPasswordController());
//     return Scaffold(
//       backgroundColor: Constants.whitColor,
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Constants().sbHt20,
//             Constants().sbHt30,
//             Row(
//               children: [
//                 const BackButtonWidget(),
//                 Text("  Forgot password",
//                     style: customTextStyle(
//                         color: Constants.mainColor,
//                         size: 15.0.sp,
//                         weight: FontWeight.w500)),
//               ],
//             ),
//             Constants().sbHt100,
//             Constants().sbHt100,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 controller: controller.emailTextEditor,
//                 decoration: const InputDecoration(
//                   label: Text("Email"),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Constants().sbHt30,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Constants.mainColor,
//                       padding: const EdgeInsets.all(10)),
//                   onPressed: () {
//                     controller.forgotPasswordUser();
//                   },
//                   child: Text(
//                     "Send OTP",
//                     style: customTextStyle(
//                         color: Constants.whitColor,
//                         size: 15.0.sp,
//                         weight: FontWeight.w500),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
