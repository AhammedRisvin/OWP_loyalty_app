import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/more/more_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';

import '../../widgets/common_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoreController controller = Get.put(MoreController());
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
                  Text("  Contact Us", style: appbarTitleStyle()),
                ],
              ),
              Constants().sbHt40,
              CustomTextFieldWidget(
                label: "Add Subject",
                controller: controller.subjectController,
                keybordType: TextInputType.text,
              ),
              Constants().sbHt10,
              CustomTextFieldWidget(
                label: "Add Complaint",
                controller: controller.complaintController,
                keybordType: TextInputType.text,
              ),
              Constants().sbHt40,
              CommonButtonWidget(
                  btnName: "Confirm",
                  function: () {
                    controller.contactUs();
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
