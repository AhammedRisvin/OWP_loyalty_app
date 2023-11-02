import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../backend/model/user/user_model.dart';
import '../../backend/services/user_services.dart';

class UserController extends GetxController implements GetxService {
  var singleUser = GetCurrentUserDetails().obs;
  RxBool isDataCome = false.obs;
  RxBool isloading = true.obs;
  var image = Rx<File?>(null);
  final String bucketName =
      'adamtechngologies'; // Replace with your S3 bucket name
  // SimpleS3 _simpleS3 = SimpleS3();
  @override
  void onInit() {
    getUserData();

    super.onInit();
  }

//tier expiry date convert
  String tierDateConver() {
    DateTime parsedDate =
        DateTime.parse(singleUser.value.data!.tierExpiry!.toString());

// Format the parsed date as "yyyy-MM-dd"
    String formattedDate =
        "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')}";
    update();
    return formattedDate;
  }

//get User data
  void getUserData() async {
    var response = await UserService.getSingleUserData();
    log(response!.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body.toString());

      singleUser.value = GetCurrentUserDetails.fromJson(data);
      isDataCome.value = true;
      log(singleUser.value.data!.countryName.toString());
    } else {
      log(response.body);
    }
    update();
  }

//date picker
  Future datePick(
      {required context, required TextEditingController controller}) async {
    final tempDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (tempDate != null) {
      controller.text =
          "${tempDate.year}-${tempDate.month.toString().padLeft(2, '0')}-${tempDate.day.toString().padLeft(2, '0')}";
      update();
    }
    update();
  }

//image pick
  Future updateProfileImage(bool isGallery) async {
    try {
      final image = await ImagePicker().pickImage(
          source: isGallery ? ImageSource.gallery : ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);

      this.image.value = imageTemporary;
      update();
    } on PlatformException catch (e) {
      log(e.toString());
    }
    update();
  }
}
