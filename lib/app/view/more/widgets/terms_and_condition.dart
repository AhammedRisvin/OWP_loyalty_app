import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/more/more_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  final WebViewController controller = WebViewController();
  final MoreController moreController = Get.put(MoreController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      moreController.init(controller,
          'https://adamtechnologies.github.io/AdamWeb/termsAndConditions.html');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whitColor,
      appBar: AppBar(title: const Text("Terms and Conditions")),
      body: Obx(
        () => Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            if (moreController.loadingPercentage.value < 100)
              LinearProgressIndicator(
                value: moreController.loadingPercentage.value / 100.0,
                color: Constants.blackColor,
              ),
          ],
        ),
      ),
    );
  }
}
