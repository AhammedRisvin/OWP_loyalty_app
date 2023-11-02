import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/auth/forgotpassword_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';

import '../../widgets/common_widgets.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key, required this.loginScreen});
  final bool loginScreen;
  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        Get.put(ForgotPasswordController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(children: [
              Constants().sbHt30,
              Constants().sbHt30,
              Row(
                children: [
                  const BackButtonWidget(),
                  Text("  Change password", style: appbarTitleStyle()),
                ],
              ),
              Constants().sbHt10,
              Constants().sbHt40,
              CustomTextFieldWidget(
                label: "Email",
                controller: controller.emailTextEditor,
                keybordType: TextInputType.text,
              ),
              Constants().sbHt20,
              CustomTextFieldWidget(
                label: "Old password",
                controller: controller.oldPasswordTextEditor,
                keybordType: TextInputType.text,
              ),
              Constants().sbHt20,
              CustomTextFieldWidget(
                label: "New password",
                controller: controller.newPasswordTextEditor,
                keybordType: TextInputType.text,
              ),
              Constants().sbHt40,
              CommonButtonWidget(
                  btnName: "Confirm",
                  function: () {
                    loginScreen == true
                        ? controller.forgotPasswordUser(isLoged: false)
                        : controller.forgotPasswordUser(isLoged: true);
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
