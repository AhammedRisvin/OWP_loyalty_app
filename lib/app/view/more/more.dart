import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/more/widgets/privacy_and_policy.dart';
import 'package:owp_loyalty/app/view/more/widgets/terms_and_condition.dart';
import 'package:owp_loyalty/app/view/wallet/cost_of_coin.dart';

import '../../controller/more/more_controller.dart';
import '../../utils/constants.dart';
import '../auth/forgot password/change_password.dart';
import '../wallet/withdraw.dart';
import '../widgets/alert_popup.dart';
import '../widgets/common_widgets.dart';
import 'widgets/contact_us.dart';
import 'widgets/opt_it_out.dart';
import 'widgets/profile_section.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoreController controller = Get.put(MoreController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Constants().sbHt50,
            Constants().sbHt10,
            const UserProfile(),
            Constants().sbHt20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.to(const CostOfCoinScreen());
                      },
                      leading: SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset("assets/images/wallet.png",
                              color: Constants.mainColor)),
                      title: Text(
                        'Recharge Wallet',
                        style: customTextStyle(
                            color: Constants.lightMainColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Constants.mainColor,
                        size: 17,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(WithdrawScreen());
                      },
                      leading: SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset("assets/images/coin-withdrow.png",
                              color: Constants.mainColor)),
                      title: Text(
                        'Withdraw',
                        style: customTextStyle(
                            color: Constants.lightMainColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Constants.mainColor,
                        size: 17,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(const ChangePassword(
                          loginScreen: false,
                        ));
                      },
                      leading: const Icon(
                        Icons.password,
                        color: Constants.lightMainColor,
                        size: 20,
                      ),
                      title: Text(
                        'Change Password',
                        style: customTextStyle(
                            color: Constants.lightMainColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Constants.mainColor,
                        size: 17,
                      ),
                    ),
                    // ListTile(
                    //   onTap: () {},
                    //   leading: SizedBox(
                    //       height: 16,
                    //       width: 16,
                    //       child: Image.asset(
                    //           "assets/images/community-guideline.png",
                    //           fit: BoxFit.fill,
                    //           color: Constants.mainColor)),
                    //   title: Text(
                    //     'Community Guidelines',
                    //     style: customTextStyle(
                    //         color: Constants.lightMainColor,
                    //         size: 13.0.sp,
                    //         weight: FontWeight.w400),
                    //   ),
                    //   trailing: const Icon(
                    //     Icons.arrow_forward_ios_outlined,
                    //     color: Constants.mainColor,
                    //     size: 17,
                    //   ),
                    // ),
                    ListTile(
                      onTap: () {
                        Get.to(const ContactUsScreen());
                      },
                      leading: const Icon(
                        Icons.phone,
                        size: 18,
                      ),
                      title: Text(
                        'Contact Us',
                        style: customTextStyle(
                            color: Constants.lightMainColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Constants.mainColor,
                        size: 17,
                      ),
                    ),

                    ListTile(
                      onTap: () {
                        Get.to(const OptItOutScreen());
                      },
                      leading: Image.asset("assets/images/complain.png",
                          height: 22, color: Constants.lightMainColor),
                      title: Text(
                        'Opt It Out',
                        style: customTextStyle(
                            color: Constants.lightMainColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Constants.mainColor,
                        size: 17,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(const TermsAndConditions());
                      },
                      leading: Image.asset(
                          "assets/images/terms-and-conditions.png",
                          height: 18,
                          color: Constants.lightMainColor),
                      title: Text(
                        'Terms & Conditions',
                        style: customTextStyle(
                            color: Constants.lightMainColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Constants.mainColor,
                        size: 17,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(const PrivacyPolicy());
                      },
                      leading: Image.asset("assets/images/privacy.png",
                          height: 19, color: Constants.lightMainColor),
                      title: Text(
                        'Privacy Policy',
                        style: customTextStyle(
                            color: Constants.lightMainColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Constants.mainColor,
                        size: 17,
                      ),
                    ),

                    //support
                    ListTile(
                      onTap: () {
                        controller.userSupport();
                        Get.bottomSheet(
                          Obx(
                            () {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: SizedBox(
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Constants().sbHt20,
                                      Image.asset(
                                        'assets/images/owp_loyalty-logo.png',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.fill,
                                      ),
                                      Constants().sbHt20,
                                      SizedBox(
                                        width: double.infinity,
                                        child: OutlinedButton.icon(
                                            style: OutlinedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  9))),
                                            ),
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.email,
                                              size: 18,
                                            ),
                                            label: Text(controller
                                                .supportModel[0].email
                                                .toString())),
                                      ),
                                      Constants().sbHt10,
                                      Obx(
                                        () => SizedBox(
                                          width: double.infinity,
                                          child: OutlinedButton.icon(
                                              style: OutlinedButton.styleFrom(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    9))),
                                              ),
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.email,
                                                size: 18,
                                              ),
                                              label: Text(controller
                                                  .supportModel[0].contact
                                                  .toString())),
                                        ),
                                      ),
                                      Constants().sbHt30,
                                      CommonButtonWidget(
                                          btnName: "CANCEL",
                                          function: () {
                                            Get.back();
                                          })
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          backgroundColor: Constants.whitColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0)),
                          ),
                        );
                      },
                      leading: Image.asset("assets/images/customer-service.png",
                          height: 20, color: Constants.lightMainColor),
                      title: Text(
                        'Support',
                        style: customTextStyle(
                            color: Constants.lightMainColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Constants.mainColor,
                        size: 17,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        showCategoryAdd(
                            context: context,
                            text: "Do you want to Logout App? ");
                      },
                      leading: const Icon(
                        Icons.logout_rounded,
                        color: Constants.toastRedColor,
                        size: 20,
                      ),
                      title: Text(
                        'Log out',
                        style: customTextStyle(
                            color: Constants.toastRedColor,
                            size: 13.0.sp,
                            weight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
