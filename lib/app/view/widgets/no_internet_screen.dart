import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/view/splash/splash.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/no_internet.jpg',
                width: context.width / 2,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "No internet connection!",
                style: context.textTheme.bodyMedium!.copyWith(
                    color: const Color.fromARGB(255, 31, 31, 31),
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Please check your internet connect and try again",
                style: context.textTheme.titleMedium!.copyWith(
                    color: Constants.greyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: context.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(234, 234, 78, 67),
                  ),
                  onPressed: () {
                    Get.offAll(const SplashScreen());
                  },
                  child: Text(
                    "Try again",
                    style: context.textTheme.titleMedium!.copyWith(
                        color: Constants.whitColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
