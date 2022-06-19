// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pa_syawy/skincare_card.dart';
import 'package:pa_syawy/list_skincare_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  List listItem = [
    'New Product',
    'Popular',
  ];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk = firestore.collection("produk");

    _tabController = new TabController(
      length: 2,
      vsync: this,
    );

    return Container(
      color: Color(0xffF0E2E2),
      child: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: StreamBuilder<QuerySnapshot>(
                stream: produk.snapshots(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 8, right: 10),
                          child: Row(
                              children: snapshot.data!.docs
                                  .map((e) => SkincareCard(
                                      id: e.id,
                                      gambar: e.get('gambar'),
                                      nama: e.get('nama'),
                                      rate: e.get('rate'),
                                      detail: e.get('detail'),
                                      harga: e.get('harga')))
                                  .toList()),
                        )
                      : Container();
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 26,
                ),
                DefaultTabController(
                  length: 2,
                  child: TabBar(
                    indicatorColor: Color(0xffAE7E73),
                    labelStyle: TextStyle(
                      color: Color(0xffAE7E73),
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    onTap: (value) {
                      _tabController.animateTo(value);
                    },
                    tabs: [
                      Tab(
                        child: Text(
                          'New Product',
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Popular',
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 360,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: produk.snapshots(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: snapshot.data!.docs
                                        .map(
                                          (e) => ListSkincareCard(
                                              id: e.id,
                                              gambar: e.get('gambar'),
                                              nama: e.get('nama'),
                                              rate: e.get('rate'),
                                              detail: e.get('detail'),
                                              price: e.get('harga')),
                                        )
                                        .toList())
                                : Container();
                          }),
                      StreamBuilder<QuerySnapshot>(
                          stream: produk
                              .where('rate', isGreaterThan: 3)
                              .snapshots(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: snapshot.data!.docs
                                        .map((e) => ListSkincareCard(
                                            id: e.id,
                                            gambar: e.get('gambar'),
                                            nama: e.get('nama'),
                                            rate: e.get('rate'),
                                            detail: e.get('detail'),
                                            price: e.get('harga')))
                                        .toList())
                                : Container();
                          }),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
