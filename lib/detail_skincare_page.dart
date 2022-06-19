// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pa_syawy/list_favorite_page.dart';
import 'package:get/get.dart';

class DetailSkincarePage extends StatefulWidget {
  const DetailSkincarePage(
      {Key? key,
      required this.name,
      required this.detail,
      required this.harga,
      required this.gambar,
      required this.rate,
      required this.id})
      : super(key: key);

  final String name, detail, harga, gambar, id;
  final String rate;
  @override
  State<DetailSkincarePage> createState() => _DetailSkincarePageState();
}

class _DetailSkincarePageState extends State<DetailSkincarePage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference favorite = firestore.collection("favorite");

    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Detail'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Color(0xffF0E2E2),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 330,
              child: Image.network(widget.gambar),
            ),
            ListView(
              children: [
                SizedBox(
                  height: 200,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff020202),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        width: 88,
                        height: 16,
                        child: widget.rate == 5
                            ? Image.asset("assets/rate_5.png")
                            : widget.rate == 4
                                ? Image.asset("assets/rate_4.png")
                                : Image.asset("assets/rate_3.png"),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        widget.detail,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff8d92a3),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Harga :",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.harga,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xff020202),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffAE7E73),
        onPressed: () {
          favorite.add({'produk_id': widget.id, 'user': 'dira'});

          Get.to(ListFavoritePage());
        },
        child: Icon(
          Icons.favorite_border,
        ),
      ),
    );
  }
}
