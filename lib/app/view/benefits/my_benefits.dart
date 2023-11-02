import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/tier/tier_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/home/widgets/tier_card.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../controller/user/user_controller.dart';
import 'widgets/tier_benefit_widget.dart';
import 'widgets/tier_container_widget.dart';

class MyBenefits extends StatelessWidget {
  const MyBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    TierController tierController = Get.put(TierController());
    final UserController userController = Get.put(UserController());
    return RefreshIndicator(
      displacement: 150,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(
          const Duration(milliseconds: 1000),
        );
        tierController.getTiers();
        tierController.tierBarChange();
        tierController.getCurrentTierDetails();
        tierController.getTokensForNexTier();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Constants().sbHt30,
                        Text("My Benefits", style: appbarTitleStyle()),
                        Constants().sbHt20,
                        TierCard(
                          home: false,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextWidgetBenefit(name: "NEPTUNE"),
                          CustomTextWidgetBenefit(name: "SATURN"),
                          CustomTextWidgetBenefit(name: "MARS"),
                          CustomTextWidgetBenefit(name: "MERCURY"),
                        ],
                      ),
                    ),
                    Obx(
                      () => Slider(
                          value: tierController.tierBarValue.value,
                          inactiveColor: Constants.greyColor,
                          activeColor: Constants.mainColor,
                          onChanged: (double) {}),
                    ),
                    Obx(
                      () => tierController.currentTier.value == "Mercury"
                          ? const SizedBox()
                          : Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(colors: [
                                    Constants.blackColor,
                                    Colors.black87,
                                  ])),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.info,
                                    color: Constants.whitColor,
                                    size: 18,
                                  ),
                                  Constants().sbWd10,
                                  Expanded(
                                    child: Text(
                                        "Earn ${tierController.getTokensForNexTierUpdation.value.toString()} tokens to avail of next tier benefits.",
                                        style: customTextStyle(
                                            color: Constants.whitColor,
                                            size: 11.sp,
                                            weight: FontWeight.w500)),
                                  ),
                                ],
                              )),
                    ),
                    Constants().sbHt5,
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(colors: [
                              Constants.blackColor,
                              Colors.black87,
                            ])),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.info,
                              color: Constants.whitColor,
                              size: 18,
                            ),
                            Constants().sbWd10,
                            Expanded(
                              child: Text(
                                  "Your tier's next renewal is on ${"userController.tierDateConver()"}",
                                  style: customTextStyle(
                                      color: Constants.whitColor,
                                      size: 11.sp,
                                      weight: FontWeight.w400)),
                            ),
                          ],
                        )),
                    Constants().sbHt20,
                    Text("Tier Benefits",
                        style: customTextStyle(
                            color: Constants.blackColor,
                            size: 20.sp,
                            weight: FontWeight.w400)),
                    Constants().sbHt20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            tierController.tierChange(0);
                          },
                          //black tier
                          child: TierContainerWidget(
                            tierImage: 'assets/images/neptune-tier-card.png',
                            tierName: "NEPTUNE",
                            controller: tierController,
                            selectTier: 0,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              tierController.tierChange(1);
                            },
                            child: TierContainerWidget(
                              tierImage: 'assets/images/saturn_tier_card.png',
                              controller: tierController,
                              tierName: "SATURN",
                              selectTier: 1,
                            )),
                        InkWell(
                            onTap: () {
                              tierController.tierChange(2);
                            },
                            child: TierContainerWidget(
                              tierImage: 'assets/images/mars_tier_card.png',
                              controller: tierController,
                              selectTier: 2,
                              tierName: "MARS",
                            )),
                        InkWell(
                            onTap: () {
                              tierController.tierChange(3);
                            },
                            child: TierContainerWidget(
                              tierImage: 'assets/images/mercury_tier_card.png',
                              controller: tierController,
                              selectTier: 3,
                              tierName: "MERCURY",
                            )),
                      ],
                    ),
                    Constants().sbHt30,
                    Obx(
                      () => tierController.currentTier.value == "Mercury" ||
                              tierController.tierChangeValue.value == 3
                          ? const SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          title: Text(
                                            textAlign: TextAlign.center,
                                            "Are you sure?",
                                            style: customTextStyle(
                                                color: Constants.blackColor,
                                                size: 16.0.sp,
                                                weight: FontWeight.w500),
                                          ),
                                          actionsAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          actions: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text('Cancel',
                                                  style: customTextStyle(
                                                      color:
                                                          Constants.buttonColor,
                                                      size: 12.0.sp,
                                                      weight: FontWeight.w400)),
                                            ),
                                            commonRectangleButton(
                                                context: context,
                                                action: () {
                                                  tierController.tierPurchase();
                                                },
                                                title: 'Confirm'),
                                          ],
                                        );
                                      });
                                },
                                child: Container(
                                  height: 30,
                                  width: context.width,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          colors: [
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
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Center(
                                      child: Text(
                                    "Upgrade Tier",
                                    style: customTextStyle(
                                        color: Constants.whitColor,
                                        size: 12.sp,
                                        weight: FontWeight.w600),
                                  )),
                                ),
                              ),
                            ),
                    ),
                    const TierBenefitWidget()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextWidgetBenefit extends StatelessWidget {
  final String name;
  const CustomTextWidgetBenefit({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: customTextStyle(
            color: Constants.mainColor, size: 11.sp, weight: FontWeight.w400));
  }
}
