import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../../controller/tier/tier_controller.dart';

class TierContainerWidget extends StatelessWidget {
  final TierController controller;
  final String tierName;
  final String tierImage;
  final int selectTier;
  const TierContainerWidget({
    required this.controller,
    required this.tierName,
    required this.tierImage,
    required this.selectTier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.rotate(
          angle: -math.pi / 7,
          child: Container(
            height: 28,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: AssetImage(tierImage)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 0.75))
                ],
                color: Constants.mainColor),
          ),
        ),
        Constants().sbHt20,
        Text(tierName,
            style: customTextStyle(
                color: Constants.mainColor,
                size: 11.sp,
                weight: FontWeight.w400)),
        const SizedBox(
          width: 60,
          child: Divider(
            color: Constants.mainColor,
            thickness: .8,
            height: 0,
          ),
        ),
      ],
    );
  }
}
