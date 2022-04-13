import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool is_visible = true;
  RxString email = "".obs;
  RxString password = "".obs;
  late Map<String, dynamic> users;

  void getStorage() {
    if (GetStorage().hasData("users")) {
      users = GetStorage().read("users");
      email.value = users["email"];
      password.value = users["password"];
      print(users["doLogin"]);
    } else {
      print("users not found!");
    }
  }

  void doLogin(BuildContext context) {
    if (key.currentState!.validate()) {
      if (emailController.text == email.value &&
          passwordController.text == password.value) {
        users["doLogin"] = true;
        Get.offAllNamed("/home");
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: const Color(0xFF22bb33),
          message: 'login berhasil',
          duration: const Duration(seconds: 3),
        ).show(context);
      } else {
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: const Color(0xFFFF5C83),
          message: 'email atau password yang Anda masukkan salah!',
          duration: const Duration(seconds: 3),
        ).show(context);
        // print("Alamat email atau password yang kamu masukkan salah.");
      }
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getStorage();
    super.onReady();
  }
}
