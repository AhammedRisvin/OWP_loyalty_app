import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import '../../controller/wallet/wallet_cotroller.dart';
import '../../utils/constants.dart';
import '../widgets/common_widgets.dart';

class TransferCoinScreen extends StatelessWidget {
  const TransferCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController controller = Get.put(WalletController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Constants().sbHt20,
                const BackButtonWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Constants().sbHt50,
                    Constants().sbHt10,
                    SizedBox(
                      child: Image.asset(
                        "assets/images/transfere-coin-removebg-preview.png",
                        height: 110,
                      ),
                    ),
                    Constants().sbHt10,
                    Text(
                      "Transfer You'r Coins!", //How many coins do you want?
                      style: customTextStyle(
                          color: Constants.blackColor,
                          size: 14.sp,
                          weight: FontWeight.w600),
                    ),
                    Constants().sbHt50,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFieldWidget(
                          hint: "Send to",
                          label: "Enter a Wallet address",
                          controller: controller.transferCoinAdressController,
                          keybordType: TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFieldWidget(
                          label: "How many coins do you transfer?",
                          controller: controller.transferCoinAmountController,
                          keybordType: TextInputType.number),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: CustomTextFieldWidget(
                    //       label: "Remarks",
                    //       controller: controller.transferCoinRemarksController,
                    //       keybordType: TextInputType.number),
                    // ),
                    Constants().sbHt10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonButtonWidget(
                          btnName: "Confirm",
                          function: () {
                            controller.walletTransfer();
                          }),
                    ),
                    // Constants().sbHt5,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
