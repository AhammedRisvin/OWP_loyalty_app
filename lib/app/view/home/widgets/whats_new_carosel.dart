import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/home/home_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';

class WhatsNew extends StatelessWidget {
  const WhatsNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return SizedBox(
      height: 220,
      child: Obx(
        () => controller.getWhatsNewOfferList.isEmpty
            ? const SizedBox()
            : CarouselSlider.builder(
                options: CarouselOptions(
                  height: 210,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  // initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: controller.getWhatsNewOfferList.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  var newOffers = controller.getWhatsNewOfferList[itemIndex];
                  return InkWell(
                    onTap: () {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) =>  OfferDetails(),
                      // ));
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 210,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            foregroundDecoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    // Colors.transparent,
                                    Colors.black45,
                                    Colors.black45,
                                  ]),
                            ),
                            child: Image.network(newOffers.image.toString(),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Text(
                                    textAlign: TextAlign.center,
                                    newOffers.description.toString(),
                                    // overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        shadows: const [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2,
                                                2), // Specify the x and y offset of the shadow
                                            blurRadius:
                                                3, // Specify the blur radius of the shadow
                                          ),
                                        ],
                                        fontSize: 14.0.sp,
                                        color: Constants.whitColor,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: Constants.fontMulish)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Text(newOffers.description.toString(),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        shadows: const [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2,
                                                2), // Specify the x and y offset of the shadow
                                            blurRadius:
                                                3, // Specify the blur radius of the shadow
                                          ),
                                        ],
                                        fontSize: 10.0.sp,
                                        color: Constants.whitColor,
                                        height: 1.5,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: Constants.fontMulish)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
