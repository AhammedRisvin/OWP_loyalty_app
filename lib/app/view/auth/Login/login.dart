import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/auth/signup_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/auth/signup/signup.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../../controller/auth/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final LoginController controller = Get.put(LoginController());
  final SignupController scontroller = Get.put(SignupController());
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whitColor,
      body: Padding(
        padding: EdgeInsets.all(8.0.wp),
        child: SingleChildScrollView(
          child: Column(children: [
            Constants().sbHt40,
            Constants().sbHt30,
            Column(
              children: [
                Constants().sbHt5,
                SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      "assets/images/owp_loyalty-logo.png",
                      fit: BoxFit.fill,
                    )),
                Constants().sbHt5,
                Text("BY OWPMF",
                    style: customTextStyle(
                        color: Constants.mainColor,
                        size: 9.0.sp,
                        weight: FontWeight.w400)),
              ],
            ),
            Constants().sbHt20,
            Text("LOG IN",
                style: customTextStyle(
                    color: Constants.mainColor,
                    size: 20.0.sp,
                    weight: FontWeight.w500)),
            Constants().sbHt30,
            Constants().sbHt30,
            CustomTextFieldWidget(
                label: "Email",
                controller: controller.emailTextEditor,
                keybordType: TextInputType.emailAddress),
            // TextField(
            //   keyboardType: TextInputType.emailAddress,
            //   controller: controller.emailTextEditor,
            //   decoration: const InputDecoration(
            //     label: Text("Email"),
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            Constants().sbHt20,
            Obx(
              () => TextField(
                controller: controller.passwordTextEditor,
                obscureText: controller.passwordVisible.value,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  label: const Text("Password"),
                  labelStyle: TextStyle(
                      fontFamily: Constants.fontMulish, fontSize: 12.sp),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.togglePasswordBtn();
                      },
                      icon: Icon(
                        controller.passwordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 18,
                      )),
                ),
              ),
            ),
            Constants().sbHt20,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     InkWell(
            //       onTap: () => Get.to(const ChangePassword(
            //         loginScreen: true,
            //       )),
            //       child: Text("Forgot Password? ",
            //           style: customTextStyle(
            //               color: Constants.buttonColor,
            //               size: 11.0.sp,
            //               weight: FontWeight.w400)),
            //     ),
            //   ],
            // ),
            Constants().sbHt20,
            CommonButtonWidget(
                btnName: "Log in", function: () => controller.onLogin()),
            Constants().sbHt10,
            Constants().sbHt5,
            Text("OR",
                style: customTextStyle(
                    color: Constants.mainColor,
                    size: 12.0.sp,
                    weight: FontWeight.w500)),
            Constants().sbHt10,
            Constants().sbHt5,
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(9))),
                        backgroundColor: Constants.whitColor,
                        padding: const EdgeInsets.all(8)),
                    onPressed: () {
                      Get.to(const SignupScreen());
                    },
                    child: Text(
                      "Create Account",
                      style: customTextStyle(
                          color: Constants.buttonColor,
                          size: 12.0.sp,
                          weight: FontWeight.w500),
                    ))),
            const SizedBox(height: 60),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                  height: 2.5,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'By using our services are agreeing to our '),
                  TextSpan(
                      text: 'Terms ',
                      style: TextStyle(color: Color(0xff2959D5))),
                  TextSpan(
                    text: 'and ',
                  ),
                  TextSpan(
                      text: 'Privacy statement ',
                      style: TextStyle(color: Color(0xff2959D5))),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
