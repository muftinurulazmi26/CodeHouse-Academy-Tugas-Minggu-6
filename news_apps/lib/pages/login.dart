import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
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
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool is_visible = true;
  late SharedPreferences sharedPreferences;

  void initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void doLogin() {
    if (_key.currentState!.validate()) {
      if (emailController.text == sharedPreferences.getString("email") &&
          passwordController.text == sharedPreferences.getString("password")) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: const Color(0xFFFF5C83),
            message:
                'Alamat email atau password yang kamu masukkan salah.',
            duration: const Duration(seconds: 3),
          ).show(context);
        // print("Alamat email atau password yang kamu masukkan salah.");
      }
    }
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
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
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
                      controller: emailController,
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
                      controller: passwordController,
                      obscureText: is_visible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (is_visible) {
                              is_visible = false;
                            } else {
                              is_visible = true;
                            }
                            setState(() {});
                          },
                          child: (is_visible)
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
                        doLogin();
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
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
