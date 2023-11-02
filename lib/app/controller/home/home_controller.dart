import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:owp_loyalty/app/backend/services/banner_services.dart';
import 'package:owp_loyalty/app/backend/services/project_services.dart';

import '../../backend/model/home/banner_model.dart';
import '../../backend/model/home/project_model.dart';
import '../../backend/model/home/whats_new_model.dart';
import '../../backend/services/whats_new_services.dart';

class HomeController extends GetxController implements GetxService {
  RxList<WhatsNewModal> getWhatsNewOfferList = <WhatsNewModal>[].obs;
  RxList<BannerModel> getBannerList = <BannerModel>[].obs;
  RxList<ProjectModel> getProjectList = <ProjectModel>[].obs;

  @override
  void onInit() {
    getWhatsNewOffers();
    getBanners();
    getProjects();
    super.onInit();
  }

//get what's new offers
  void getWhatsNewOffers() async {
    var response = await WhatsNewServices.getWhatsNewOffers();
    if (response!.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      getWhatsNewOfferList.clear();
      for (var item in data['data']) {
        WhatsNewModal offer = WhatsNewModal.fromJson(item);
        getWhatsNewOfferList.add(offer);
        update();
      }
      update();
    } else {
      log(response.body);
    }
    update();
  }

//get Banners
  void getBanners() async {
    var response = await BannerServices.getBanners();
    log(response!.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());
      getBannerList.clear();
      for (var item in data['data']) {
        BannerModel offer = BannerModel.fromJson(item);
        getBannerList.add(offer);
      }
    } else {
      log(response.body);
    }
    update();
  }

//get projects
  void getProjects() async {
    var response = await ProjectServices.getProjects();
    log(response!.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());
      getProjectList.clear();
      for (var item in data['data']) {
        ProjectModel project = ProjectModel.fromJson(item);
        getProjectList.add(project);
      }
    } else {
      log(response.body);
    }
    update();
  }
}
