import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pa_syawy/edit_skincare_page.dart';
import 'package:pa_syawy/resep_item.dart';
import 'package:get/get.dart';
import 'package:pa_syawy/tambah_skincare_page.dart';

class ListDataSkincarePage extends StatelessWidget {
  const ListDataSkincarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk = firestore.collection("produk");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffAE7E73),
        title: Text('List Data Product'),
      ),
      body: ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: produk.snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => ResepItem(
                              nama: e.get('nama'),
                              bahan: e.get('detail'),
                              onUpdate: () {
                                Get.off(EditDataSkincarePage(id: e.id));
                              },
                              onDelete: () {
                                produk.doc(e.id).delete();
                              },
                            ),
                          )
                          .toList(),
                    )
                  : Text('Loading...');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffAE7E73),
        onPressed: () {
          Get.to(TambahSkincarePage());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
