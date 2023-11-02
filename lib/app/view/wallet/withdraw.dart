import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/prefference.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../controller/wallet/wallet_cotroller.dart';
import '../../utils/custom_searchable_dropdown_package.dart';

class WithdrawScreen extends StatelessWidget {
  WithdrawScreen({super.key});
  final countryfocus = FocusNode();
  final bankfocus = FocusNode();
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
                        "assets/images/coin-withdrow.png",
                        height: 100,
                      ),
                    ),
                    Constants().sbHt10,
                    Text(
                      "Withdraw You'r Coin", //How many coins do you want?
                      style: customTextStyle(
                          color: Constants.blackColor,
                          size: 14.sp,
                          weight: FontWeight.w600),
                    ),
                    Constants().sbHt50,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextFieldWidget(
                          label: "How many coins do you withdraw?",
                          controller: controller.withdrawCoinAmountController,
                          keybordType: TextInputType.number),
                    ),
//commmon search text field - country
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonSearchField(
                          controller: controller.withdrawCountryController,
                          // hintStyle: context.textTheme.bodySmall!.copyWith(
                          //   fontSize: 16,
                          //   color: AppColors.grey,
                          // ),
                          readOnly: false,
                          icon: Icons.keyboard_arrow_down_rounded,
                          label: "Country",
                          iconColor: Constants.mainColor,
                          searchStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          onSearchTextChanged: (query) {
                            final filter = controller.getCountryList
                                .where((element) => element
                                    .toString()
                                    .toLowerCase()
                                    .contains(query.toLowerCase()))
                                .toList();
                            return filter
                                .map((e) => SearchFieldListItem<String>(
                                    e.toString(), e.toString(),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 12),
                                      child: Text(e.toString(),
                                          style: context.textTheme.bodySmall!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                    )))
                                .toList();
                          },
                          key: const Key("countryKey"),
                          hint: 'Country',
                          suggestionsDecoration: SuggestionDecoration(
                              border: Border.all(color: Constants.greyColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          suggestions: controller.getCountryList
                              .map(
                                (e) => SearchFieldListItem<String>(
                                  e.toString(),
                                  e.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 12),
                                    child: Text(
                                      e.toString(),
                                      style:
                                          context.textTheme.bodySmall!.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          focusNode: countryfocus,
                          onSuggestionTap: (p0) async {
                            prefs.setString(
                                Constants.selectedCountry, p0.value);
                            log(p0.value);
                            controller.getCountrybasedBankDetails(
                                countryName: p0.value);
                            countryfocus.unfocus();
                          },
                        ),
                      ),
                    ),
//commmon search text field bank
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CommonSearchField(
                          controller: controller.withdrawBankController,
                          // hintStyle: context.textTheme.bodySmall!.copyWith(
                          //   fontSize: 16,
                          //   color: AppColors.grey,
                          // ),
                          readOnly: false,
                          icon: Icons.keyboard_arrow_down_rounded,
                          label: "Bank Name",
                          iconColor: Constants.mainColor,
                          searchStyle: context.textTheme.bodySmall!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          onSearchTextChanged: (query) {
                            final filter = controller.getCountrybasedBankList
                                .where((element) => element.branchName
                                    .toString()
                                    .toLowerCase()
                                    .contains(query.toLowerCase()))
                                .toList();
                            return filter
                                .map((e) => SearchFieldListItem<String>(
                                    e.branchName.toString(),
                                    e.branchName.toString(),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 12),
                                      child: Text(e.branchName.toString(),
                                          style: context.textTheme.bodySmall!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                    )))
                                .toList();
                          },
                          key: const Key("bankKey"),
                          hint: 'Bank',
                          suggestionsDecoration: SuggestionDecoration(
                              border: Border.all(color: Constants.greyColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          suggestions: controller.getCountrybasedBankList
                              .map(
                                (e) => SearchFieldListItem<String>(
                                  e.branchName.toString(),
                                  e.branchName.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 12),
                                    child: Text(
                                      e.branchName.toString(),
                                      style:
                                          context.textTheme.bodySmall!.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          focusNode: bankfocus,
                          onSuggestionTap: (p0) async {
                            controller.withdrawBankController.text = p0.value;
                            // prefs.setString(Constants.selectedCountry, p0.value);
                            // log(p0.value);
                            // controller.getCountrybasedBankDetails(
                            //     countryName: p0.value);
                            bankfocus.unfocus();
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextFieldWidget(
                          label: "Account Number",
                          controller:
                              controller.withdrawAccountNumberController,
                          keybordType: TextInputType.number),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonButtonWidget(
                          btnName: "Confirm",
                          function: () {
                            controller.walletWithdraw();
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
