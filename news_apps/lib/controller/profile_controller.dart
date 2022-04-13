import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  RxString name = "".obs;
  RxString placeOfBirth = "".obs;
  RxString dateOfBirth = "".obs;
  RxString email = "".obs;
  late Map<String, dynamic> users;

  void getStorage() {
    if (GetStorage().hasData("users")) {
      users = GetStorage().read("users");
      name.value = users["name"];
      email.value = users["email"];
      placeOfBirth.value = users["place_of_birth"];
      dateOfBirth.value = users["date_of_birth"];
      print(users["doLogin"]);
    } else {
      print("users not found!");
    }
  }

  void doLogout(BuildContext context) {
    GetStorage().erase();
    Get.offAllNamed("/login");
    Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: const Color(0xFFFF5C83),
          message: 'logout berhasil!',
          duration: const Duration(seconds: 3),
        ).show(context);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getStorage();
    super.onReady();
  }
}
