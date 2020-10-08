import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class MyImage extends StatefulWidget {
  MyImage({Key key}) : super(key: key);

  @override
  _MyImageState createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  File imgloc;
  clickimage() async {
    var picker = ImagePicker();
    var img = await picker.getImage(source: ImageSource.camera);
    var imgurl;
    setState(
      () {
        imgloc = File(img.path);
      },
    );
    var fbstorage = FirebaseStorage.instance.ref().child("MyImages").child("img.jpg");
    fbstorage.putFile(imgloc);
    imgurl = await fbstorage.getDownloadURL();
    print(imgurl);
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: clickimage,
          child: Icon(Icons.camera),
          elevation: 10,
          splashColor: Colors.amber,
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text("My Image"),
        ),
        body: Center(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 3, color: Colors.blue[800])),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(50),
                  child: imgloc == null
                      ? Text("No Picture Selected",
                          style: GoogleFonts.abhayaLibre(
                              color: Colors.red,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                      : Image.file(imgloc),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
