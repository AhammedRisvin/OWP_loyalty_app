import 'package:flutter/material.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

class CustomPassbookButton extends StatelessWidget {
  final String name;
  final void Function()? function;
  const CustomPassbookButton({
    super.key,
    required this.function,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: function,
      style: OutlinedButton.styleFrom(
        foregroundColor: Constants.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        name.toString(),
        style: customTextStyle(size: 13, weight: FontWeight.w600),
      ),
    );
  }
}
