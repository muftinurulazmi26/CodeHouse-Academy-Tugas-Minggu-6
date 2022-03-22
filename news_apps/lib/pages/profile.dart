import 'package:flutter/material.dart';
import 'package:news_apps/pages/login.dart';
import 'package:news_apps/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "";
  String placeOfBirth = "";
  String dateOfBirth = "";
  String email = "";
  late SharedPreferences sharedPreferences;

  void initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString("name")!;
      placeOfBirth = sharedPreferences.getString("place_of_birth")!;
      dateOfBirth = sharedPreferences.getString("date_of_birth")!;
      email = sharedPreferences.getString("email")!;
    });
  }

  void doLogout() {
    sharedPreferences.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void initState() {
    initShared();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/person1.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "hi, $name!",
                      style: TextStyle(
                        color: greyColor3,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "$placeOfBirth, $dateOfBirth",
                      style: TextStyle(
                        fontSize: 12,
                        color: greyColor3,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 12,
                        color: greyColor4,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 36.5,
              ),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 12,
                  color: greyColor5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // CardMenuAccount(
              //   iconLeft: "assets/icons/ic_user_settings.png",
              //   title: "Account Setting",
              //   iconRight: "assets/icons/ic_forward.png",
              // ),
              // CardMenuAccount(
              //   iconLeft: "assets/icons/ic_appointment_scheduling.png",
              //   title: "History",
              //   iconRight: "assets/icons/ic_forward.png",
              // ),
              // CardMenuAccount(
              //   iconLeft: "assets/icons/ic_star.png",
              //   title: "Rate This Apps",
              //   iconRight: "assets/icons/ic_forward.png",
              // ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Other Info",
                style: TextStyle(
                  fontSize: 12,
                  color: greyColor5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // CardMenuOtherInfo(
              //   title: "About this Apps",
              //   subTitle: "Version 1.0.0",
              // ),
              // CardMenuOtherInfo(
              //   title: "Privacy Policy",
              //   subTitle: "",
              // ),
              // CardMenuOtherInfo(
              //   title: "FAQ",
              //   subTitle: "",
              // ),
              // CardMenuOtherInfo(
              //   title: "Terms Of Service",
              //   subTitle: "",
              // ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  doLogout();
                },
                child: Container(
                  width: double.infinity,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/ic_logout.png"),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 12,
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
