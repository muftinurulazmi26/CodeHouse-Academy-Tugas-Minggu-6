import 'package:get/get.dart';
import 'package:news_apps/controller/home_controller.dart';
import 'package:news_apps/repository/news_repository.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NewsRepository());
  }
}
