// ignore_for_file: prefer_const_declarations, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_syawy/controllers/main_page_controller.dart';
import 'package:pa_syawy/home_page.dart';
import 'package:pa_syawy/profile_page.dart';
import 'package:pa_syawy/search_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final List<BottomNavigationBarItem> _myItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  final List<Widget> _myPages = [HomePage(), ProfilePage()];
  final MainPageController mainPageController = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFFF0E2E2),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: const Color(0xffAE7E73),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Syawy",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Let's Get Some Skincare",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Image.asset(
                      "assets/profile-pic.png",
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            body: _myPages.elementAt(controller.tabIndex),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xffAE7E73),
              selectedItemColor: Color(0xffF0E2E2),
              unselectedItemColor: Colors.black,
              currentIndex: controller.tabIndex,
              items: _myItem,
              onTap: controller.changeTabIndex,
            ),
          ),
        );
      },
    );
  }
}
