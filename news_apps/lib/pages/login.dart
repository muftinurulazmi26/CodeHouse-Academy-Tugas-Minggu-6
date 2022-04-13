import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_apps/controller/login_controller.dart';
import 'package:news_apps/pages/home.dart';
import 'package:news_apps/pages/register.dart';
import 'package:news_apps/theme.dart';
import 'package:news_apps/widgets/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController loginController;

  @override
  void initState() {
    // initShared();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loginController = Get.find<LoginController>();
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Form(
              key: loginController.key,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 18,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      "Sign In to continue",
                      style: TextStyle(color: greyColor),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(color: blackColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Email tidak boleh kosong!";
                        }
                        return null;
                      },
                      controller: loginController.emailController,
                      decoration: InputDecoration(
                        fillColor: fieldColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: "Enter Email",
                      ),
                      style: TextStyle(color: blackColor2),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(color: blackColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Password tidak boleh kosong!";
                        }
                        return null;
                      },
                      controller: loginController.passwordController,
                      obscureText: loginController.is_visible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (loginController.is_visible) {
                              loginController.is_visible = false;
                            } else {
                              loginController.is_visible = true;
                            }
                            setState(() {});
                          },
                          child: (loginController.is_visible)
                              ? Image.asset("assets/icons/ic_eye.png")
                              : Image.asset("assets/icons/ic_hidden_eye.png"),
                        ),
                        fillColor: fieldColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: "Enter Password",
                      ),
                      style: TextStyle(color: blackColor2),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        loginController.doLogin(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: greenColor),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 234,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont’t have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: greyColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed("/register");
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
