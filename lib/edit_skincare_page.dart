// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pa_syawy/list_data_skincare_page.dart';
import 'package:path/path.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

class EditDataSkincarePage extends StatefulWidget {
  EditDataSkincarePage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<EditDataSkincarePage> createState() => _EditDataSkincarePageState();
}

class _EditDataSkincarePageState extends State<EditDataSkincarePage> {
  TextEditingController namaController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk = firestore.collection("produk");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffAE7E73),
        title: Text(
          "Edit Data Product",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: produk.doc(widget.id).snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Divider(),
                        TextField(
                          controller: namaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: snapshot.data!.get('nama'),
                          ),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: imageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: snapshot.data!.get('gambar'),
                          ),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: priceController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: snapshot.data!.get('harga'),
                          ),
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          controller: deskripsiController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: snapshot.data!.get('detail'),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffAE7E73)),
                            onPressed: () {
                              if (namaController.text == "" ||
                                  imageController.text == "" ||
                                  deskripsiController.text == "" ||
                                  priceController.text == "") {
                                produk.doc(widget.id).update({
                                  'nama': snapshot.data!.get('nama'),
                                  'gambar': snapshot.data!.get('image'),
                                  'detail': snapshot.data!.get('detail'),
                                  'harga': snapshot.data!.get('harga'),
                                  'rate': 4,
                                });
                                Get.snackbar(
                                  "",
                                  "",
                                  backgroundColor: Colors.blueAccent,
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  titleText: Text(
                                    "Success",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  messageText: Text(
                                    'Edit Data Product Berhasil',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              } else {
                                produk.doc(widget.id).update({
                                  'nama': namaController.text,
                                  'gambar': imageController.text,
                                  'detail': deskripsiController.text,
                                  'harga': priceController.text,
                                  'rate': 4,
                                });
                                Get.to(ListDataSkincarePage());
                                Get.snackbar(
                                  "",
                                  "",
                                  backgroundColor: Colors.blueAccent,
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  titleText: Text(
                                    "Success",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  messageText: Text(
                                    'Edit Data Product Berhasil',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                              // uploadImageToFirebase(context);
                            },
                            child: Text("Edit"),
                          ),
                        ),
                      ],
                    ),
                  )
                : Text("tes");
          }),
    );
  }
}
