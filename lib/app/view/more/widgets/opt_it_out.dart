import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/more/more_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';

import '../../widgets/common_widgets.dart';

class OptItOutScreen extends StatelessWidget {
  const OptItOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoreController controller = Get.put(MoreController());
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            Constants().sbHt30,
            Constants().sbHt30,
            Row(
              children: [
                const BackButtonWidget(),
                Text("  Opt It Out", style: appbarTitleStyle()),
              ],
            ),
            Constants().sbHt40,
            Constants().sbHt20,
            CustomTextFieldWidget(
              label: "Suggetions",
              controller: controller.optitoutController,
              keybordType: TextInputType.text,
            ),
            Constants().sbHt20,
            CommonButtonWidget(
                btnName: "Confirm",
                function: () {
                  controller.optitOut();
                }),
          ]),
        ),
      ),
    );
  }
}
