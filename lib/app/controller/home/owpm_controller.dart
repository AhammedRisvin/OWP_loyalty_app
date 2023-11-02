import 'dart:async';

import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';

class OwpmCOntroller extends GetxController {
  late Timer _timer;
  RxInt days = 0.obs;
  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;
  late tz.Location dubai;
  late tz.TZDateTime nextSunday8PM;

  @override
  void onInit() {
    tz.initializeTimeZones();
    dubai = tz.getLocation('Asia/Dubai');
    calculateCountdown();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      calculateCountdown();
    });
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

//Lottery draw countdown
  void calculateCountdown() {
    final now = tz.TZDateTime.now(dubai);
    final nextSunday = tz.TZDateTime(dubai, now.year, now.month,
        now.day + (DateTime.sunday - now.weekday + 7) % 7, 20);
    if (now.isAfter(nextSunday)) {
      nextSunday.add(const Duration(days: 7));
    }
    nextSunday8PM = nextSunday;
    final countdown = nextSunday8PM.difference(now);

    days.value = countdown.inDays;
    hours.value = countdown.inHours.remainder(24);
    minutes.value = countdown.inMinutes.remainder(60);
    seconds.value = countdown.inSeconds.remainder(60);

    update();
  }

//owpm access function
  void launchOWPMApp() async {
    if (!await launchUrl(Uri.parse("com.adam.adam_education"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }

    update();
  }

//live draw youtube  access function
  void launchYoutubForLiveDraw() async {
    if (!await launchUrl(
        Uri.parse("https://youtube.com/@OWPM-so7pr?si=aOyIBWmQA5lV2QfS"),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch ';
    }

    update();
  }
}
