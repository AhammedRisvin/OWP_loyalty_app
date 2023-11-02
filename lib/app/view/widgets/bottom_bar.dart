import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/controller/home/owp_sweat_controller.dart';
import 'package:owp_loyalty/app/controller/user/user_controller.dart';
import 'package:owp_loyalty/app/utils/constants.dart';
import 'package:owp_loyalty/app/view/more/more.dart';

import '../../controller/tier/tier_controller.dart';
import '../benefits/my_benefits.dart';
import '../home/home.dart';
import '../owpp/owpp.dart';
import '../wallet/passbook.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final UserController controller = Get.put(UserController());
      controller.getUserData();
      Get.put(TierController());
      Get.put(OwpSweatController()).getMyTodaySteps();
    });
    super.initState();
  }

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const OwppScreen(),
    const MyBenefits(),
    const PassBookScreen(bottom: true),
    const MoreScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/planet-earth (2).png",
              height: 22,
            ),
            label: 'Owpp',
          ),
          const BottomNavigationBarItem(
            icon: SizedBox(
              height: 25,
            ),
            label: 'Benefits',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_sharp), //menu_book_rounded
            label: 'Passbook',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu_sharp),
            label: 'More',
          ),
        ],
        // type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color.fromARGB(255, 120, 119, 119),
        selectedItemColor: Constants.mainColor,
        // iconSize: 30,
        onTap: _onItemTapped,
        // elevation: 5
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: CenterFab(
        fun: () => _onItemTapped(2),
      ),
    );
  }
}

class CenterFab extends StatelessWidget {
  final void Function()? fun;
  const CenterFab({super.key, required this.fun});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      width: 56.0,
      height: 56.0,
      child: Column(
        children: [
          FloatingActionButton(
            elevation: 1,
            backgroundColor: Constants.whitColor,
            onPressed: fun,
            child: Image.asset("assets/images/owp_loyalty-logo.png"),
          ),
        ],
      ),
    );
  }
}
