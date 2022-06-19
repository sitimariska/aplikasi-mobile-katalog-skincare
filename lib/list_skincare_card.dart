// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_syawy/detail_skincare_page.dart';

class ListSkincareCard extends StatelessWidget {
  const ListSkincareCard(
      {Key? key,
      required this.gambar,
      required this.nama,
      required this.detail,
      required this.rate,
      required this.price,
      required this.id})
      : super(key: key);

  final String gambar, id;
  final String nama;
  final String detail;
  final int rate;

  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DetailSkincarePage(
            id: id,
            name: nama,
            detail: detail,
            harga: price,
            gambar: gambar,
            rate: rate.toString(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              child: Image.network(gambar),
            ),
            SizedBox(width: 29),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff020202),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: Color(0xff8d92a3),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 50),
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Container(
                height: 16,
                child: rate == 5
                    ? Image.asset("assets/rate_5.png")
                    : rate == 4
                        ? Image.asset("assets/rate_4.png")
                        : Image.asset("assets/rate_3.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
