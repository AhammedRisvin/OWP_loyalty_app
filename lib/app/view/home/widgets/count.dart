import 'package:flutter/material.dart';

import 'package:owp_loyalty/app/utils/size_config.dart';

import '../../../utils/constants.dart';
import '../../widgets/common_widgets.dart';

class TimeCountWidget extends StatelessWidget {
  final int count;
  const TimeCountWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundImage: const AssetImage("assets/images/owpm_count_bg.png"),
      child: Text(
        count.toString(),
        style: customTextStyle(
            color: Constants.mainColor, size: 14.sp, weight: FontWeight.w700),
      ),
    );
  }
}
