import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';

import '../../utils/constants.dart';

TextStyle customTextStyle({Color? color, FontWeight? weight, double? size}) {
  return TextStyle(
      color: color,
      fontFamily: Constants.fontMulish,
      fontWeight: weight,
      fontSize: size);
}

TextStyle appbarTitleStyle() {
  return TextStyle(
      color: Constants.mainColor,
      fontFamily: Constants.fontMulish,
      fontWeight: FontWeight.w500,
      fontSize: 20.sp);
}

void successtoast({title, duration = 2}) {
  HapticFeedback.lightImpact();
  Get.showSnackbar(GetSnackBar(
    icon: Image.asset(
      "assets/images/owp_loyalty-logo.png",
      height: 20,
      width: 20,
    ),
    backgroundColor: Constants.mainColor,
    message: title != '' ? title : 'Something went wrong',
    duration: Duration(seconds: duration),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(20),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.down,
  ));
}

void failurtoast({title, duration = 2}) {
  HapticFeedback.lightImpact();
  Get.showSnackbar(GetSnackBar(
    icon: Image.asset(
      "assets/images/owp_loyalty-logo.png",
      height: 20,
      width: 20,
    ),
    backgroundColor: Colors.red,
    message: title != '' ? title : 'Something went wrong',
    duration: Duration(seconds: duration),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(20),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.down,
  ));
  // Fluttertoast.showToast(
  //     msg: title,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 2,
  //     backgroundColor: Constants.toastRedColor,
  //     textColor: Colors.white,
  //     fontSize: 16.0);
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios));
  }
}

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget(
      {super.key, required this.btnName, required this.function});
  final void Function()? function;
  final String btnName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                backgroundColor: Constants.mainColor,
                padding: const EdgeInsets.all(8)),
            onPressed: function,
            child: Text(btnName,
                style: customTextStyle(
                    color: Constants.whitColor,
                    size: 13.0.sp,
                    weight: FontWeight.w500))));
  }
}

ElevatedButton commonRectangleButton(
    {required BuildContext context,
    required VoidCallback action,
    required String title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10),
      backgroundColor: Constants.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(fontSize: 23),
    ),
    onPressed: action,
    child: SizedBox(
      width: 100,
      height: 18,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}

class CustomTextFieldWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keybordType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function()? onTap;
  const CustomTextFieldWidget({
    required this.label,
    required this.controller,
    required this.keybordType,
    this.validator,
    this.hint,
    this.suffixIcon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keybordType,
      validator: validator,
      autofocus: false,
      style:
          const TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontFamily: Constants.fontMulish, fontSize: 12.sp),
        label: Text(label!),
        labelStyle:
            TextStyle(fontFamily: Constants.fontMulish, fontSize: 12.sp),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}

void showLoading() {
  Get.dialog(Padding(
    padding: const EdgeInsets.symmetric(horizontal: 90.0),
    child: Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CircularProgressIndicator()],
        ),
      ),
    ),
  ));
}

void hideLoading() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
}

DropdownButtonFormField2<String> customDropdownMethod(
    {required String type,
    void Function(String?)? onSaved,
    required List<String> items}) {
  return DropdownButtonFormField2<String>(
    isExpanded: true,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(7.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      // Add more decoration..
    ),
    hint: Text(
      'Select Your $type',
      style: TextStyle(fontFamily: Constants.fontMulish, fontSize: 12.sp),
    ),
    items: items
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return 'Please select $type.';
      }
      return null;
    },
    onChanged: onSaved,
    onSaved: (value) {
      // controller.selectedValue = value.toString();
    },
    buttonStyleData: const ButtonStyleData(
      padding: EdgeInsets.only(right: 8),
    ),
    iconStyleData: const IconStyleData(
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 24,
    ),
    // dropdownStyleData: DropdownStyleData(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(0),
    //   ),
    // ),
    menuItemStyleData: const MenuItemStyleData(
      padding: EdgeInsets.symmetric(horizontal: 16),
    ),
  );
}
