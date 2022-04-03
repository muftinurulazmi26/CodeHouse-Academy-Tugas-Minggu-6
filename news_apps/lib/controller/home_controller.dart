import 'package:get/get.dart';
import 'package:news_apps/model/news.dart';
import 'package:news_apps/repository/news_repository.dart';

class HomeController extends GetxController {
  NewsRepository newsRepository = Get.find<NewsRepository>();
  RxList list_news = <News>[].obs;
  RxBool isLoading=false.obs;

  void callAPI() {
    isLoading.value=true;
    newsRepository.getNews().then((List<News> value) {
      list_news.addAll(value);
      isLoading.value=false;
    }).catchError((err, track) {
      print("Something wrong ${err} ${track}");
    });
  }

  @override
  void onReady() {
    callAPI();
    super.onReady();
  }
}
