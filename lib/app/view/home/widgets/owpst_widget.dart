import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/home/owp_sweat_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

class OwpstWidget extends StatelessWidget {
  final bool home;
  const OwpstWidget({super.key, this.home = true});

  @override
  Widget build(BuildContext context) {
    OwpSweatController owpSweatController = Get.put(OwpSweatController());
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 8, right: 10),
      child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/owps_comming.png"))),
          height: 140,
          width: context.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40.0.wp, top: 45),
                child: Obx(
                  () => Text(
                    owpSweatController.todayStepCount.value.toString(),
                    style: customTextStyle(
                        color: const Color.fromARGB(255, 216, 185, 82),
                        size: 30.sp,
                        weight: FontWeight.w800),
                  ),
                ),
              ),
              Constants().sbHt10,
              Padding(
                padding: EdgeInsets.only(
                  left: 50.wp,
                ),
                child: Text(
                  "STEPS",
                  style: customTextStyle(
                      color: const Color.fromARGB(255, 216, 185, 82),
                      size: 10.sp,
                      weight: FontWeight.w600),
                ),
              ),
            ],
          )),
    );
  }
}
