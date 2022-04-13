import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_apps/injector.dart';
import 'package:news_apps/pages/home.dart';
import 'package:news_apps/pages/login.dart';
import 'package:get/get.dart';
import 'package:news_apps/pages/profile.dart';
import 'package:news_apps/pages/register.dart';
import 'package:news_apps/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/splash",
      getPages: [
        GetPage(
            name: "/splash",
            page: ()=>SplashPage(),
            binding: Injector()
        ),
        GetPage(
            name: "/login",
            page: ()=>LoginPage(),
            binding: Injector()
        ),
        GetPage(
            name: "/register",
            page: ()=>RegisterPage(),
            binding: Injector()
        ),
        GetPage(
            name: "/home",
            page: ()=>HomePage(),
            binding: Injector()
        ),
        GetPage(
            name: "/profile",
            page: ()=>ProfilePage(),
            binding: Injector()
        )
      ],
    );
  }
}