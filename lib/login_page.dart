// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_syawy/main_page.dart';
import 'package:pa_syawy/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> tipe;

  TextEditingController usernameController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user = firestore.collection("user");

    return Container(
      color: Color(0xffff0e2e2),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logooo.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Login to your account ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          color: Color(0xffAE7E73),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff969697)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffAE7E73)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff969697)),
                        ),
                        hintText: "Username",
                        prefixIcon: Icon(Icons.person)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff969697)),
                        ),
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: RaisedButton(
                    onPressed: () async {
                      if (usernameController.text == "" ||
                          passwordController == "") {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: Colors.red,
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Login Failed",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          messageText: Text(
                            "Please Fill All Field In Form",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (usernameController.text == "admin" ||
                          passwordController == "admin") {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('tipe', 'admin');

                        Get.offAll(MainPage());
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: Colors.blueAccent,
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Login Success",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          messageText: Text(
                            'Welcome Back!',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('tipe', 'user');
                        Get.offAll(MainPage());
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: Colors.blueAccent,
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Login Success",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          messageText: Text(
                            'Welcome Back!',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Color(0xffAE7E73),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width / 2) - 60,
                        height: 1,
                        color: Color(0xff969697),
                      ),
                      Text(
                        'or',
                        style: TextStyle(
                          color: Color(0xff969697),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width / 2) - 60,
                        height: 1,
                        color: Color(0xff969697),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: RaisedButton(
                    onPressed: () {
                      Get.to(RegisterPage());
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Color(0xff969697),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
