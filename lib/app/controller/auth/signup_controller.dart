import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owp_loyalty/app/backend/model/auth/get_country_model.dart';
import 'package:owp_loyalty/app/backend/services/auth_services.dart';
import 'package:owp_loyalty/app/view/auth/Login/login.dart';

import '../../backend/model/auth/get_state_and_cit_.model.dart';
import '../../view/widgets/common_widgets.dart';

class SignupController extends GetxController implements GetxService {
  final emailTextEditor = TextEditingController();
  final passwordTextEditor = TextEditingController();
  final userNameTextEditor = TextEditingController();
  // final dobNameTextEditor = TextEditingController();
  // final lastNameTextEditor = TextEditingController();
  // final streetAdressTextEditor = TextEditingController();
  // final pincodeTextEditor = TextEditingController();
  // final bankIbanTextEditor = TextEditingController();
  // final bankNameTextEditor = TextEditingController();
  // final contactNoTextEditor = TextEditingController();
  // final professionTextEditor = TextEditingController();
  // final passportNoTextEditor = TextEditingController();
  final nationalityTextEditor = TextEditingController();
  // final countryofResidenceTextEditor = TextEditingController();
  // final stateTextEditor = TextEditingController();
  // final cityTextEditor = TextEditingController();
  RxBool passwordVisible = true.obs;
  String selectedValue = '';
  RxList<GetCountryModel> getCountryList = <GetCountryModel>[].obs;
  RxList<StateModel> getStateAndCityList = <StateModel>[].obs;
  RxList<String> getStateList = <String>[].obs;
  RxList<String> getCityList = <String>[].obs;
  RxList<String> countryList = <String>[].obs;
  RxString selectedCountryId = "".obs;
  List<String> nodata = [
    "nodata",
    "nodata",
    "nodata",
  ];
  List<String> professions = [
    "Accountant",
    "Actor",
    "Architect",
    "Artist",
    "Auto mechanic",
    "Aviator",
    "Bakers",
    "Banker",
    "Barber",
    "Bricklayer",
    "Bus driver",
    "Businessperson",
    "Butcher",
    "Cashier",
    "Chef",
    "Cleaner",
    "Dentist",
    "Designer",
    "Dietitian",
    "Electrician",
    "Engineer",
    "Estate agent",
    "Farmer",
    "Firefighter",
    "Fisherman",
    "Gardener",
    "Hairdresser",
    "Journalist",
    "Judge",
    "Labourer",
    "Lawyer",
    "Librarian",
    "Lifeguard",
    "Mail carrier",
    "Model",
    "Nurse",
    "Optician",
    "Painter and decorator",
    "Pharmacist",
    "Photographer",
    "Physician",
    "Plumber",
    "Police officer",
    "Politician",
    "Salesperson",
    "Scientist",
    "Secretary",
    "Soldier",
    "Tailor",
    "Teacher",
    "Veterinarian",
    "Waiting staff",
    "Others"
  ];

  @override
  void onInit() {
    debugPrint('api call');
    super.onInit();
    getCOuntry();
    emailTextEditor.text = '';
    passwordTextEditor.text = '';
  }

//get country list
  void getCOuntry() async {
    var response = await AuthServices.getCountryList();
    if (response!.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());
      // getStateList.value = [];
      // getStateAndCityList.value = [];
      getCountryList.value = [];
      countryList.value = [];

      update();
      for (var item in data) {
        GetCountryModel country = GetCountryModel.fromJson(item);
        getCountryList.add(country);
        countryList.add(country.name.toString());
      }
    } else {
      log(response.body);
    }
    update();
  }

//get selectedcountry id
  void getSelectedCountryId() {
    for (var item in getCountryList) {
      if (item.name.toString() == selectedValue.toString()) {
        selectedCountryId.value = item.id!;
        update();
        log("selectedCountryId  : $selectedCountryId");
      }
    }
    update();
  }

//get State and city list
  void getStateandCityList() async {
    getSelectedCountryId();
    Map<String, String> params = {"_id": selectedCountryId.value};
    log(params.toString());
    var response = await AuthServices.getStateListAndCity(id: params);
    // log("rssss state" + response!.body);
    if (response!.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body.toString());
      // log("data" + data.toString());
      getStateList.value = [];
      getStateAndCityList.value = [];
      update();
      for (var item in data) {
        for (var element in item["states"]) {
          log("message");
          // log(item["states"].toString());
          StateModel statesAndCity = StateModel.fromJson(element);
          getStateAndCityList.add(statesAndCity);
          getStateList.add(statesAndCity.name.toString());
        }
      }
    } else {
      log(response.body);
    }
    update();
  }

//get city list based on the state
  void cityList() {
    for (var element in getStateAndCityList) {
      if (element.name == selectedValue) {
        getCityList.value = [];
        update();
        for (var city in element.cities!) {
          getCityList.add(city.name.toString());
        }
        log("city $getCityList");
      }
    }
    update();
  }

  Future createAccountUser() async {
    if (userNameTextEditor.text.isEmpty ||
            passwordTextEditor.text.isEmpty ||
            emailTextEditor.text.isEmpty ||
            // dobNameTextEditor.text.isEmpty ||
            // countryofResidenceTextEditor.text.isEmpty ||
            // stateTextEditor.text.isEmpty ||
            // cityTextEditor.text.isEmpty ||
            // streetAdressTextEditor.text.isEmpty ||
            // pincodeTextEditor.text.isEmpty ||
            // contactNoTextEditor.text.isEmpty ||
            // passportNoTextEditor.text.isEmpty ||
            nationalityTextEditor.text.isEmpty
        // bankIbanTextEditor.text.isEmpty ||
        // bankNameTextEditor.text.isEmpty ||
        // professionTextEditor.text.isEmpty
        ) {
      failurtoast(
        title: "Please enter all fields",
      );
    } else {
      // for (var element in getCountryList) {
      //   if (countryofResidenceTextEditor.text == element.name.toString()) {
      //     countryofResidenceTextEditor.clear();
      //     countryofResidenceTextEditor.text = element.iso2.toString();
      //   }
      // }

      Map data = {
        "country_code": nationalityTextEditor.text,
        "username": userNameTextEditor.text,
        "password": passwordTextEditor.text,
        // "contact": contactNoTextEditor.text,
        "email": emailTextEditor.text,
        // "date_of_birth": dobNameTextEditor.text,
        // "nationality": nationalityTextEditor.text,
        // "passport_number": passportNoTextEditor.text,
        // "profession": professionTextEditor.text,
        // "address": {
        //   "street": streetAdressTextEditor.text,
        //   "city_town": cityTextEditor.text,
        //   "state": stateTextEditor.text,
        //   "pin_code": pincodeTextEditor.text
        // },
        // "iban": bankIbanTextEditor.text,
        // "bank_name": bankNameTextEditor.text,
        // "ip_address":":::1"
      };
      log('-ssssss---$data');
      showLoading();
      var response = await AuthServices.getCreatAccountService(body: data);

      log(response!.body.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        // prefs.setBool("isSignedIn", true);
        // prefs.setString("userEmail", emailTextEditor.text);
        // firstNameTextEditor.clear();
        // professionTextEditor.clear();
        // bankNameTextEditor.clear();
        // bankIbanTextEditor.clear();
        nationalityTextEditor.clear();
        // passportNoTextEditor.clear();
        // contactNoTextEditor.clear();
        // pincodeTextEditor.clear();
        // streetAdressTextEditor.clear();
        // cityTextEditor.clear();
        // stateTextEditor.clear();
        // countryofResidenceTextEditor.clear();
        // dobNameTextEditor.clear();
        emailTextEditor.clear();
        // lastNameTextEditor.clear();
        hideLoading();

        successtoast(
            title: "Check the email you provided and Verify the OTP",
            duration: 3);
        Get.off(const LogInScreen());
      } else {
        hideLoading();
        failurtoast(
          title: json.decode(response.body)["data"]["message"].toString(),
        );
        log(response.body.toString());
      }
    }
    update();
  }

  void togglePasswordBtn() {
    passwordVisible.value = !passwordVisible.value;
    update();
  }

  // void onDOB(context) {
  //   final controller = Get.put(UserController());
  //   controller.datePick(context: context, controller: dobNameTextEditor);
  //   update();
  // }

  void handleRadioValueChange(String value) {
    selectedValue = value;
    update();
  }
}
