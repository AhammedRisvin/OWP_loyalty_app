import 'package:flutter/material.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.whitColor,
        appBar: AppBar(title: const Text("Privacy Policy")),
        body: SizedBox(
            child: SfPdfViewer.network(
                'https://www.owpc.club/assets/docs/OWPC-WEB-002-POL_Privacy%20Policy.vfinal_club.pdf',
                password: 'syncfusion')));
  }
}
