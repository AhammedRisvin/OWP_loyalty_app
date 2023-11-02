import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/home/owpm_controller.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/home/widgets/count.dart';

import '../../../utils/constants.dart';
import '../../widgets/common_widgets.dart';

class OwpmWidget extends StatelessWidget {
  final bool home;
  OwpmWidget({super.key, this.home = true});
  final OwpmCOntroller controller = Get.put(OwpmCOntroller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 180,
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Constants.mainColor,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  "OWPM's next draw is on Sunday at 8 PM (UAE)",
                  style: customTextStyle(
                      color: Constants.whitColor,
                      size: 10.sp,
                      weight: FontWeight.w600),
                ),
              ),
            ),
            Constants().sbHt5,
            SizedBox(
              width: context.width,
              child: Column(
                children: [
                  Constants().sbHt10,
                  Obx(
                    () => Row(
                      children: [
                        InkWell(
                          onTap: () => controller.launchOWPMApp(),
                          child: Container(
                            height: 60,
                            width: 70,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage("assets/images/owpm.png")),
                                color: Constants.whitColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                        ),
                        Constants().sbWd20,
                        TimeCountWidget(count: controller.days.value),
                        Constants().sbWd20,
                        TimeCountWidget(count: controller.hours.value),
                        Constants().sbWd20,
                        TimeCountWidget(count: controller.minutes.value),
                        Constants().sbWd20,
                        TimeCountWidget(count: controller.seconds.value),
                      ],
                    ),
                  ),
                  Constants().sbHt10,
                  Constants().sbHt5,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => controller.launchOWPMApp(),
                          child: Container(
                            width: 59.wp,
                            decoration: const BoxDecoration(
                                color: Constants.greyColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                "BUY OUR CERTIFICATE",
                                style: customTextStyle(
                                    color: Constants.blackColor,
                                    size: 10.sp,
                                    weight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        Constants().sbWd10,
                        InkWell(
                          onTap: () => controller.launchYoutubForLiveDraw(),
                          child: Container(
                            width: 30.wp,
                            decoration: BoxDecoration(
                                border: Border.all(color: Constants.greyColor),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 3),
                              child: Image.asset(
                                "assets/images/live-draw.png",
                                fit: BoxFit.contain,
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Constants().sbHt10,
                ],
              ),
            )

            // const Divider()
          ],
        ),
      ),
    );
  }
}
