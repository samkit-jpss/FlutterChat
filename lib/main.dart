import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app/screens/chat.dart';
import 'package:login_app/screens/home.dart';
import 'package:login_app/screens/image.dart';
import 'package:login_app/screens/login.dart';
import 'package:login_app/screens/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
     
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "login": (contex) => MyLogin(),
        "reg": (contex) => MyRegistration(),
        "chat": (contex) => MyChat(),
        "home": (contex) => HomePage(),
        "image": (contex) => MyImage(),
      },
    ),
  );
}