import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/tier/tier_controller.dart';
import 'package:owp_loyalty/app/controller/wallet/wallet_cotroller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/view/home/widgets/owpm_widget.dart';
import 'package:owp_loyalty/app/view/home/widgets/owpst_widget.dart';
import 'package:owp_loyalty/app/view/home/widgets/tier_card.dart';
import 'package:owp_loyalty/app/view/widgets/bottom_bar.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/home/home_controller.dart';
import '../../controller/token/token_controllert.dart';
import '../../controller/user/user_controller.dart';

class SkeletonScreen extends StatefulWidget {
  const SkeletonScreen({super.key});

  @override
  State<SkeletonScreen> createState() => _SkeletonScreenState();
}

class _SkeletonScreenState extends State<SkeletonScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.put(UserController());
      Get.put(WalletController());
      Get.put(TokenController());
      Get.put(HomeController()).getProjects();
      Get.put(HomeController());
      Get.put(TierController());
    });
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomBar())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Constants.greyColor,
          highlightColor: Colors.grey.shade500,
          direction: ShimmerDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Constants().sbHt40,
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TierCard(
                    home: false,
                  )),
              Constants().sbHt10,
              OwpmWidget(home: false),
              const OwpstWidget(
                home: false,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Constants.whitColor),
                      color: Constants.mainColor),
                ),
              ),
              Constants().sbHt10,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 20,
                    color: Colors.amber,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns in the grid.
                    crossAxisSpacing: 8, // Spacing between columns.
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(
                            color: Constants.greyColor,
                            blurRadius: 1.0,
                            offset: Offset(0.0, 0.75))
                      ], borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
