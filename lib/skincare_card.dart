// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_syawy/detail_skincare_page.dart';

class SkincareCard extends StatelessWidget {
  SkincareCard(
      {Key? key,
      required this.gambar,
      required this.nama,
      required this.rate,
      required this.detail,
      required this.harga,
      required this.id})
      : super(key: key);

  final String gambar, id;
  final String nama;
  final int rate;
  final String detail;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailSkincarePage(
            id: id,
            name: nama,
            detail: detail,
            harga: harga,
            gambar: gambar,
            rate: rate.toString()));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 200,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0xfff2f2f2),
              blurRadius: 15,
              offset: Offset(0, 6),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Color(0xfff1f1f1),
              ),
              child: Image.network(gambar),
            ),
            Text(
              nama,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff020202),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 88,
              height: 16,
              child: rate == 5
                  ? Image.asset(
                      "assets/rate_5.png",
                    )
                  : rate == 4
                      ? Image.asset(
                          "assets/rate_4.png",
                        )
                      : Image.asset(
                          "assets/rate_3.png",
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
