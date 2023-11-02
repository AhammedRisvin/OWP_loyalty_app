import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/auth/login_controller.dart';
import 'package:owp_loyalty/app/utils/prefference.dart';
import 'package:owp_loyalty/app/view/splash/intro_screen.dart';
import 'package:owp_loyalty/app/view/widgets/no_internet_screen.dart';
import '../skeleton/skeleton_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController _myController = LoginController();
  @override
  void initState() {
    getPrefs();
    _myController.alreadySigned();
    changeScreen(context);
    // Timer(
    //     const Duration(seconds: 2),
    //     () => Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => _myController.isSignedIn.value == true
    //                 ? const SkeletonScreen()
    //                 : const LogInScreen())));
    super.initState();
  }

  bool checkingButton = false;
  Future<void> changeScreen(BuildContext context) async {
    final check = await checking();
    log(check.toString());
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (check) {
      Get.offAll(_myController.isSignedIn.value == true
          ? const SkeletonScreen()
          : const IntroScreen());
    } else {
      Get.offAll(const NoInternetScreen());
    }
    setState(() {});
  }

  Future<bool> checking() async {
    checkingButton = true;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        checkingButton = false;
        return true;
      }
      checkingButton = false;
      return false;
    } on SocketException catch (_) {
      log('not connected');
      checkingButton = false;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
              height: 180,
              width: 180,
              child: Image.asset(
                "assets/images/owp_loyalty-logo.png",
                fit: BoxFit.fill,
              )),
        ));
  }
}
