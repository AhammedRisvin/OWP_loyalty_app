import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/utils/size_config.dart';
import 'package:owp_loyalty/app/view/auth/Login/login.dart';
import 'package:owp_loyalty/app/view/widgets/common_widgets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final CarouselController _controller = CarouselController();

  int _currentIndex = 0;
  void onDonePress() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        height: double.infinity,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      carouselController: _controller,
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (i == 1)
                    _buildSlide1(context)
                  else if (i == 2)
                    _buildSlide2(context)
                  else if (i == 3)
                    _buildSlide3(context)
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildSlide1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Constants().sbHt100,
          Constants().sbHt100,
          SizedBox(
              height: 150,
              child: Image.asset("assets/images/owp_loyalty-logo.png")),
          Constants().sbHt20,
          Text(
              textAlign: TextAlign.center,
              "Loyalty Program For One World Peace Maker Foundation",
              style: customTextStyle(
                color: Constants.whitColor,
                size: 14.0.sp,
                weight: FontWeight.w800,
              )),
        ],
      ),
    );
  }

  Widget _buildSlide2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Constants().sbHt100,
          Constants().sbHt100,
          SizedBox(
              height: 150,
              child: Image.asset("assets/images/owp_loyalty-logo.png")),
          Constants().sbHt20,
          Text(
              textAlign: TextAlign.center,
              "Join our transformative Loyalty Program designed exclusively for the One World Peace Maker Foundation (OWPMF) community.",
              style: customTextStyle(
                color: Constants.whitColor,
                size: 12.0.sp,
                weight: FontWeight.w800,
              )),
        ],
      ),
    );
  }

  Widget _buildSlide3(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Constants().sbHt100,
          Constants().sbHt100,
          SizedBox(
              height: 150, child: Image.asset("assets/images/owpcToken.png")),
          Constants().sbHt20,
          Text(
              textAlign: TextAlign.center,
              "Earn Peace Points as you actively contribute to both humanitarian and profit-driven initiatives.",
              style: customTextStyle(
                color: Constants.whitColor,
                size: 12.0.sp,
                weight: FontWeight.w800,
              )),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                if (_currentIndex == 0) {
                  onDonePress();
                } else {
                  _controller.previousPage();
                }
              },
              child: SizedBox(
                height: 50,
                width: 100,
                child: Center(
                  child: Text(
                    _currentIndex == 0 ? 'Skip'.tr : 'Previous'.tr,
                    style: const TextStyle(
                        fontFamily: 'bold', color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                if (_currentIndex == 2) {
                  onDonePress();
                } else {
                  _controller.nextPage();
                }
              },
              child: SizedBox(
                height: 50,
                width: 100,
                child: Center(
                  child: Text(
                    _currentIndex == 2 ? 'Get Started'.tr : 'Next'.tr,
                    style: const TextStyle(
                        fontFamily: 'bold', color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
