import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

import '../../controller/home/home_controller.dart';
import '../../env.dart';

class OwppScreen extends StatelessWidget {
  const OwppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              // alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(
                  "assets/images/owpp_top_cleanup.png",
                  fit: BoxFit.fill,
                  width: context.width,
                  height: 30.hp,
                ),
                Positioned(
                  left: 15.wp,
                  right: 15.wp,
                  top: 12.hp,
                  child: Text(
                    "One World Peace Park",
                    style: customTextStyle(
                        color: Constants.owppMainColor,
                        size: 18.sp,
                        weight: FontWeight.w900),
                  ),
                ),
                Positioned(
                  left: 10.wp,
                  right: 10.wp,
                  top: 16.hp,
                  child: Text(
                    textAlign: TextAlign.center,
                    "The World's State-Of-The-Art Green Sanctuary",
                    style: customTextStyle(
                        color: Colors.grey.shade400,
                        size: 12.sp,
                        weight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            // Container(
            //   color: Constants.owppBackgroundBlColor,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         "assets/images/OWPP1_welcome.png",
            //         fit: BoxFit.fill,
            //         width: context.width,
            //         height: 30.hp,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //         child: Text(
            //           "One World Peace Park(OWPP) is one of the world's state-of-the-art green sanctuary powered by renewable energy on a mission to plant millions of trees to combat climate change through carbon sequestration.",
            //           style: customTextStyle(
            //               color: Constants.greyColor,
            //               size: 10.sp,
            //               weight: FontWeight.w400),
            //         ),
            //       ),
            //       Constants().sbHt20,
            //       // Padding(
            //       //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
            //       //   child: Text(
            //       //     "OWPP will also have its own water supply through the Atmospheric Water Generators (AWGs). OWPP's efforts are in line with the 2030 Sustainable Development Goals (SDGs) of the United Nations.",
            //       //     style: customTextStyle(
            //       //         color: Constants.greyColor,
            //       //         size: 10.sp,
            //       //         weight: FontWeight.w400),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
            Constants().sbHt5,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                textAlign: TextAlign.start,
                "Tree Planting Programme",
                style: customTextStyle(
                    color: Constants.mainColor,
                    size: 16.sp,
                    weight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                textAlign: TextAlign.start,
                "Planting trees is one of the most effective ways to reduce atmospheric carbon dioxide (CO2) and limit global warming.",
                style: customTextStyle(
                    color: Constants.mainColor,
                    size: 11.sp,
                    weight: FontWeight.w700),
              ),
            ),
            Constants().sbHt5,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.wp),
              child: Image.asset(
                "assets/images/owpp-tree-planting-removebg-preview.png", //assets/images/OWPPPeople.png
                fit: BoxFit.contain,
                width: context.width,
                height: 35.hp,
              ),
            ),
            Constants().sbHt5,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns in the grid.
                    crossAxisSpacing: 8, // Spacing between columns.
                    mainAxisSpacing: 8,
                  ),
                  itemCount: controller.getProjectList.length,
                  itemBuilder: (context, index) {
                    final project = controller.getProjectList[index];
                    return Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(Environments.baseUrlImg +
                                  project.image.toString())),
                          boxShadow: const [
                            BoxShadow(
                                color: Constants.greyColor,
                                blurRadius: 1.0,
                                offset: Offset(0.0, 0.75))
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      // child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(8),
                      //     child: Center(child: Text(project.title.toString()))),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
