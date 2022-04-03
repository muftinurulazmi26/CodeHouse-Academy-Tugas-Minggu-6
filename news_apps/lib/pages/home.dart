import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_apps/controller/home_controller.dart';
import 'package:news_apps/model/news.dart';
import 'package:news_apps/pages/profile.dart';
import 'package:news_apps/repository/news_repository.dart';
import 'package:news_apps/theme.dart';
import 'package:news_apps/widgets/loading_view.dart';
import 'package:news_apps/widgets/photo_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void selectedIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List pagesList = [
    HomeScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: selectedIndex,
        selectedItemColor: blueColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: blueColor),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile"),
        ],
      ),
      body: pagesList[_currentIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  String name = "";
  late SharedPreferences sharedPreferences;
  late HomeController homeController;

  @override
  Widget build(BuildContext context) {
    homeController = Get.find<HomeController>();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/person1.png"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "hi, $name",
                      style: TextStyle(
                        color: greyColor3,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Image.asset("assets/icons/ic_notification.png")
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Welcome to",
              style: TextStyle(
                color: greyColor5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Text(
                "News Apps",
                style: TextStyle(
                  color: greyColor5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Obx(() => homeController.list_news.isEmpty
                  ? LoadingView()
                  : ListView.builder(
                      itemCount: homeController.list_news.length,
                      itemBuilder: (context, index) {
                        return PhotoCard(news: homeController.list_news[index]);
                      },
                    ),)
            )
          ],
        ),
      ),
    );
  }
}
