// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pa_syawy/list_data_skincare_page.dart';
import 'package:pa_syawy/list_favorite_page.dart';
import 'package:pa_syawy/login_page.dart';
import 'package:pa_syawy/profile_card.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List listItem = ['Account', 'Syawy'];
  late String _tipe;

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tipe = prefs.getString("tipe")!;
    setState(() {
      _tipe = _tipe;
    });
  }

  @override
  void initState() {
    super.initState();
    _tipe = "";
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Image.asset(
            "assets/profile-pic.png",
            width: 150,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _tipe,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          _tipe == "admin"
              ? GestureDetector(
                  onTap: () {
                    Get.to(ListDataSkincarePage());
                  },
                  child: ProfileCard(
                    'Manajemen Data Skincare',
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Get.to(ListFavoritePage());
                  },
                  child: ProfileCard(
                    'List Favorite',
                  ),
                ),
          SizedBox(
            height: 10,
          ),
          ProfileCard(
            'Syarat Dan Ketentuan',
          ),
          SizedBox(
            height: 10,
          ),
          ProfileCard(
            'Kebijakan Privasi',
          ),
          SizedBox(
            height: 10,
          ),
          ProfileCard(
            'Tentang Aplikasi',
          ),
          SizedBox(
            height: 10,
          ),
          ProfileCard(
            'FAQ',
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              await preferences.clear();
              Get.offAll(LoginPage());
            },
            child: ProfileCard(
              'Logout',
            ),
          ),
        ],
      )),
    );
  }
}
