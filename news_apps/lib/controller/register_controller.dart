import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final box = GetStorage();
  bool is_visible = true;

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  void saveToStorage(BuildContext context) async {
    if (key.currentState!.validate()) {
      Map<String, dynamic> user = {
        "name": nameController.text,
        "place_of_birth": placeOfBirthController.text,
        "date_of_birth": dateOfBirthController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "doLogin": false,
      };
      box.write('users', user).then((value) {
        Get.offAllNamed("/login");
      });
      Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: const Color(0xFF22bb33),
          message: 'register berhasil, silahkan lakukan login!',
          duration: const Duration(seconds: 3),
        ).show(context);
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
