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

class TambahSkincarePage extends StatefulWidget {
  TambahSkincarePage({Key? key}) : super(key: key);

  @override
  State<TambahSkincarePage> createState() => _TambahSkincarePageState();
}

class _TambahSkincarePageState extends State<TambahSkincarePage> {
  File? _imageFile;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile!.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image1" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(_imageFile!);
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((value) => print("Done : $value"));
    });
  }

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
          "Tambah Data Product",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Divider(),
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nama Product",
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: imageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Image Product",
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Harga Product",
              ),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: deskripsiController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Manfaat Product",
              ),
            ),
            Container(
              width: 200,
              height: 50,
              alignment: Alignment.center,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: const Color(0xffAE7E73)),
                onPressed: () {
                  if (namaController.text == "" ||
                      imageController.text == "" ||
                      deskripsiController.text == "" ||
                      priceController.text == "") {
                    Get.snackbar(
                      "",
                      "",
                      backgroundColor: Colors.red,
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      titleText: Text(
                        "Failed",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      messageText: Text(
                        "Please Fill All Field In Form",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    produk.add({
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
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      messageText: Text(
                        'Tambah Data Product Berhasil',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  // uploadImageToFirebase(context);
                },
                child: Text("Tambah"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
