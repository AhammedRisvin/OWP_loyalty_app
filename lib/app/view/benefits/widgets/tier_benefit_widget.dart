import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../../controller/tier/tier_controller.dart';

class TierBenefitWidget extends StatelessWidget {
  const TierBenefitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TierController tierController = Get.put(TierController());
    return Obx(
      () => Card(
        shadowColor: Constants.greyColor,
        elevation: .5,
        child: Container(
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(begin: Alignment.bottomLeft, colors: [
                Color(0xff000000),
                Color.fromARGB(255, 70, 69, 69),
                Color.fromARGB(255, 61, 60, 60),
                Color.fromARGB(255, 53, 53, 53),
                Color(0xff000000),
              ]),
              boxShadow: [
                const BoxShadow(
                    color: Constants.greyColor,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer),
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer),
                const BoxShadow(
                    color: Constants.greyColor,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer)
              ],
              color: Colors.white,
              borderRadius: tierController.tierChangeValue.value == 3
                  ? BorderRadius.circular(10)
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
          // height: context.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(tierController
                                      .tierChangeValue.value ==
                                  0
                              ? "assets/images/neptune-tier-card.png"
                              : tierController.tierChangeValue.value == 1
                                  ? "assets/images/saturn_tier_card.png"
                                  : tierController.tierChangeValue.value == 2
                                      ? "assets/images/mars_tier_card.png"
                                      : "assets/images/mercury_tier_card.png")),
                      // color: Colors.blue.shade400,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        tierController.tierChangeValue.value == 0
                            ? "NEPTUNE"
                            : tierController.tierChangeValue.value == 1
                                ? "SATURN"
                                : tierController.tierChangeValue.value == 2
                                    ? "MARS"
                                    : "MERCURY",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Constants.whitColor,
                          fontSize: 16.sp,
                          fontFamily: Constants.fontMulish,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        )),
                  ),
                ),
                Constants().sbHt10,
                Text(
                    textAlign: TextAlign.center,
                    tierController.tierChangeValue.value == 0
                        ? tierController.getAllTierList[0].description
                            .toString()
                        : tierController.tierChangeValue.value == 1
                            ? tierController.getAllTierList[1].description
                                .toString()
                            : tierController.tierChangeValue.value == 2
                                ? tierController.getAllTierList[2].description
                                    .toString()
                                : tierController.getAllTierList[3].description
                                    .toString(),
                    style: TextStyle(
                      color: Constants.ligtgreyColor,
                      fontSize: 12.sp,
                      fontFamily: Constants.fontMulish,
                      fontWeight: FontWeight.w500,
                      // letterSpacing: 1,
                    )),
                Constants().sbHt10,
                Text(
                    tierController.tierChangeValue.value == 0
                        ? "${tierController.getAllTierList[0].price == null ? "FREE" : tierController.getAllTierList[0].price.toString()} OWPC"
                        : tierController.tierChangeValue.value == 1
                            ? "${tierController.getAllTierList[1].price.toString()} OWPC"
                            : tierController.tierChangeValue.value == 2
                                ? "${tierController.getAllTierList[2].price.toString()} OWPC"
                                : "${tierController.getAllTierList[3].price.toString()} OWPC",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 18.sp,
                      fontFamily: Constants.fontMulish,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    )),
                Text(
                  "Annually",
                  style: customTextStyle(
                      color: Constants.ligtgreyColor,
                      size: 11.sp,
                      weight: FontWeight.w400),
                ),
                Text(
                  "Benefits :",
                  style: customTextStyle(
                      color: Colors.blue.shade400,
                      size: 11.sp,
                      weight: FontWeight.w400),
                ),
                SizedBox(
                    width: context.width,
                    child: tierController.tierChangeValue.value == 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: tierController.neptuneBenefitList.length,
                            itemBuilder: (context, index) {
                              final beneft =
                                  tierController.neptuneBenefitList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: CustomTierBenefitText(
                                  text: beneft,
                                ),
                              );
                            },
                          )
                        : tierController.tierChangeValue.value == 1
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount:
                                    tierController.saturBenefitList.length,
                                itemBuilder: (context, index) {
                                  final beneft =
                                      tierController.saturBenefitList[index];
                                  return CustomTierBenefitText(
                                    text: beneft,
                                  );
                                },
                              )
                            : tierController.tierChangeValue.value == 2
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount:
                                        tierController.marsBenefitList.length,
                                    itemBuilder: (context, index) {
                                      final beneft =
                                          tierController.marsBenefitList[index];
                                      return CustomTierBenefitText(
                                        text: beneft,
                                      );
                                    },
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount: tierController
                                        .mercuryBenefitList.length,
                                    itemBuilder: (context, index) {
                                      final beneft = tierController
                                          .mercuryBenefitList[index];
                                      return CustomTierBenefitText(
                                        text: beneft,
                                      );
                                    },
                                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTierBenefitText extends StatelessWidget {
  final String text;
  const CustomTierBenefitText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.clip,
      "✓ $text",
      style: customTextStyle(
          color: Constants.whitColor, size: 11.sp, weight: FontWeight.w400),
    );
  }
}
