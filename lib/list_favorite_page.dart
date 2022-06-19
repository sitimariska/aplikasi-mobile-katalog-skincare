import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pa_syawy/list_skincare_card.dart';
import 'package:pa_syawy/skincare_card.dart';

class ListFavoritePage extends StatelessWidget {
  const ListFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference favorite = firestore.collection("favorite");
    CollectionReference produk = firestore.collection("produk");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffAE7E73),
        title: Text('List Data Product'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: favorite.snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: snapshot.data!.docs
                        .map(
                          (e) => StreamBuilder<QuerySnapshot>(
                            stream: produk.snapshots(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? StreamBuilder<DocumentSnapshot>(
                                      stream: produk
                                          .doc(e.get('produk_id'))
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        return snapshot.hasData
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, left: 8, right: 10),
                                                child: Column(children: [
                                                  ListSkincareCard(
                                                      gambar: snapshot.data!
                                                          .get('gambar'),
                                                      nama: snapshot.data!
                                                          .get('nama'),
                                                      rate: snapshot.data!
                                                          .get('rate'),
                                                      detail: snapshot.data!
                                                          .get('detail'),
                                                      price: snapshot.data!
                                                          .get('harga'),
                                                      id: snapshot.data!.id)
                                                ]))
                                            : Container();
                                      })
                                  : Container();
                            },
                          ),
                        )
                        .toList(),
                  )
                : Container();
          }),
    );
  }
}
