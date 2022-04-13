import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_apps/controller/register_controller.dart';
import 'package:news_apps/pages/home.dart';
import 'package:news_apps/pages/login.dart';
import 'package:news_apps/theme.dart';
import 'package:news_apps/widgets/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterController registerController;

  @override
  Widget build(BuildContext context) {
    registerController = Get.find<RegisterController>();
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Form(
              key: registerController.key,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.offAllNamed("/login");
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 18,
                              color: blackColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      "Register to create an account",
                      style: TextStyle(color: greyColor),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(color: blackColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name tidak boleh kosong!";
                        }
                        return null;
                      },
                      controller: registerController.nameController,
                      decoration: InputDecoration(
                        fillColor: fieldColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: "Enter Name",
                      ),
                      style: TextStyle(color: blackColor2),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Place Of Birth",
                      style: TextStyle(color: blackColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Place Of Birth tidak boleh kosong!";
                        }
                        return null;
                      },
                      controller: registerController.placeOfBirthController,
                      decoration: InputDecoration(
                        fillColor: fieldColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: "Enter Place Of Birth",
                      ),
                      style: TextStyle(color: blackColor2),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Date Of Birth",
                      style: TextStyle(color: blackColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Date Of Birth tidak boleh kosong!";
                        }
                        return null;
                      },
                      controller: registerController.dateOfBirthController,
                      decoration: InputDecoration(
                        fillColor: fieldColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: "dd/mm/yyyy",
                      ),
                      style: TextStyle(color: blackColor2),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(color: blackColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email tidak boleh kosong!";
                        } else {
                          if (!registerController.isValidEmail(value)) {
                            return "Email tidak valid!";
                          }
                        }
                        return null;
                      },
                      controller: registerController.emailController,
                      keyboardType: TextInputType.emailAddress,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password tidak boleh kosong!";
                        }
                        return null;
                      },
                      controller: registerController.passwordController,
                      obscureText: registerController.is_visible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (registerController.is_visible) {
                              registerController.is_visible = false;
                            } else {
                              registerController.is_visible = true;
                            }
                            setState(() {});
                          },
                          child: (registerController.is_visible)
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
                        // saveToPref();
                        registerController.saveToStorage(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: greenColor),
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 145,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: greyColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed("/login");
                          },
                          child: Text(
                            "Log in",
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
