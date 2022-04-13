import 'package:get/get.dart';
import 'package:news_apps/controller/home_controller.dart';
import 'package:news_apps/controller/login_controller.dart';
import 'package:news_apps/controller/profile_controller.dart';
import 'package:news_apps/controller/register_controller.dart';
import 'package:news_apps/controller/splash_controller.dart';
import 'package:news_apps/repository/news_repository.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => NewsRepository());
  }
}
