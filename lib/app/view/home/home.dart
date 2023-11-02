import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/token/token_controllert.dart';
import 'package:owp_loyalty/app/controller/user/user_controller.dart';
import 'package:owp_loyalty/app/controller/wallet/wallet_cotroller.dart';
import 'package:owp_loyalty/app/env.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/home/widgets/tier_card.dart';

import '../../controller/home/home_controller.dart';
import '../../controller/home/owp_sweat_controller.dart';
import '../../controller/tier/tier_controller.dart';
import '../widgets/common_widgets.dart';
import 'widgets/owpm_widget.dart';
import 'widgets/owpst_widget.dart';
import 'widgets/whats_new_carosel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    Get.put(OwpSweatController()).getMyTodaySteps();
    return RefreshIndicator(
      displacement: 150,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await Future.delayed(
          const Duration(milliseconds: 1000),
        );
        Get.put(UserController()).getUserData();
        Get.put(TokenController()).getToken();
        Get.put(WalletController()).getWallet();
        Get.put(WalletController()).getPassbook(3);
        Get.put(WalletController()).getRedeemPassbook();
        var homecontroller = Get.put(HomeController());
        homecontroller.getBannerList();
        homecontroller.getProjectList();
        homecontroller.getWhatsNewOfferList();
        var tierController = Get.put(TierController());
        tierController.getTiers();
        tierController.tierBarChange();
        tierController.getCurrentTierDetails();
        tierController.getTokensForNexTier();
        Get.put(OwpSweatController()).getMyTodaySteps();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Constants().sbHt40,
              Padding(padding: const EdgeInsets.all(12.0), child: TierCard()),
              const WhatsNew(),
              Constants().sbHt10,
              OwpmWidget(),
              Constants().sbHt10,
              const OwpstWidget(),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10.0),
              //   child: BannerWidget(),
              // ),
              Constants().sbHt10,

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 60.wp,
                            child: Column(
                              children: [
                                Text("UNLEASH GREEN CHANGE AT OWPP",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Constants.owppMainColor)),
                                const Divider(
                                  height: 2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: Image.asset(
                              "assets/images/owpc.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      Constants().sbHt10,
                      Text(
                          "Planting Trees, Fighting Climate Change, Creating a Sustainable Future",
                          style: customTextStyle(
                              color: Colors.grey.shade800,
                              size: 11.sp,
                              weight: FontWeight.w500)),
                      Constants().sbHt5,
                      Text("OUR GOAL",
                          style: customTextStyle(
                              color: Constants.owppMainColor,
                              size: 13.sp,
                              weight: FontWeight.w700)),
                      Constants().sbHt5,
                      Image.asset(
                        "assets/images/owpp-home-img.png",
                        fit: BoxFit.fill,
                        height: 200,
                        width: context.width,
                      ),
                      Constants().sbHt5,
                      Text(
                          "At One World Peace Park (OWPP), our goal is unequivocal: to ignite a profound shift towards a greener, more sustainable future. We're driven by a resolute commitment to combat climate change head-on through strategic tree planting initiatives and innovative carbon sequestration efforts.",
                          style: customTextStyle(
                              color: Colors.grey.shade800,
                              size: 10.sp,
                              weight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "OUR PROJECTS ",
                  style: customTextStyle(
                      color: Constants.mainColor,
                      size: 16.sp,
                      weight: FontWeight.w600),
                ),
              ),
              Constants().sbHt10,
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: controller.getProjectList.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: 150,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            // gridDelegate:
                            //     const SliverGridDelegateWithFixedCrossAxisCount(
                            //   crossAxisCount: 3, // Number of columns in the grid.
                            //   crossAxisSpacing: 8, // Spacing between columns.
                            //   mainAxisSpacing: 8,
                            // ),
                            itemCount: controller.getProjectList.length,
                            itemBuilder: (context, index) {
                              final project = controller.getProjectList[index];
                              return Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            Environments.baseUrlImg +
                                                project.image.toString())),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Constants.greyColor,
                                          blurRadius: 1.0,
                                          offset: Offset(0.0, 0.75))
                                    ],
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Center(
                                        child: Text(project.title.toString()))),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                Constants().sbWd10,
                          ),
                        ),
                ),
              ),
              Constants().sbHt20,
            ],
          ),
        ),
      ),
    );
  }
}

// class BannerWidget extends StatelessWidget {
//   const BannerWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.put(HomeController());
//     return SizedBox(
//       height: 150,
//       child: ListView.separated(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         physics: const ScrollPhysics(),
//         itemCount: controller.getBannerList.length,
//         separatorBuilder: (context, index) => Constants().sbWd10,
//         itemBuilder: (context, index) {
//           final banner = controller.getBannerList[index];
//           return Stack(
//             children: [
//               Container(
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(5)),
//                 child: Image.network(
//                   Environments.baseUrlImg + banner.image.toString(),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Positioned(
//                 top: 120,
//                 left: 60,
//                 child: Text(
//                   banner.title.toString(),
//                   style: customTextStyle(
//                       color: Constants.whitColor,
//                       size: 16.sp,
//                       weight: FontWeight.w500),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
