import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension MediaQuerySize on BuildContext {
  Size getSize() => MediaQuery.of(this).size;
}

extension PercentSized on num {
  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
}

extension ResponsiveText on num {
  double get sp => Get.width / 100 * (this / 3);
  double get tp => (this * (Get.width / 3) / 100);
  double get px => (Get.width - (Get.width - this));
}
