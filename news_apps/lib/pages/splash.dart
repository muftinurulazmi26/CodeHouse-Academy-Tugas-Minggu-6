import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_apps/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  late SplashController splashController;

  @override
  Widget build(BuildContext context) {
    splashController = Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
