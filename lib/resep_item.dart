// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ResepItem extends StatelessWidget {
  const ResepItem(
      {Key? key,
      required this.nama,
      required this.bahan,
      required this.onUpdate,
      required this.onDelete})
      : super(key: key);

  final String nama;
  final String bahan;
  final VoidCallback onUpdate;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            nama,
            //widget.keterangan.picturePath,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            bahan,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              InkWell(
                onTap: onUpdate,
                child: Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(8),
                  child: Text("Edit"),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: onDelete,
                child: Container(
                  color: Colors.orangeAccent,
                  padding: EdgeInsets.all(8),
                  child: Text("Hapus"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width,
            height: 1,
          ),
        ],
      ),
    );
  }
}
