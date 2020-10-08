import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyRegistration extends StatefulWidget {
  MyRegistration({Key key}) : super(key: key);

  @override
  _MyRegistrationState createState() => _MyRegistrationState();
}

class _MyRegistrationState extends State<MyRegistration> {
  String email;
  var authc = FirebaseAuth.instance;
  String pass;
  bool sspin = false;
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return ModalProgressHUD(
          inAsyncCall: sspin,
          child: Scaffold(
        appBar: AppBar(
          title: Text("Registration Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your email", icon: Icon(Icons.email)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    pass = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      icon: Icon(Icons.visibility)),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                        sspin = true;
                      });
                      
                  try {
                    var user = await authc.createUserWithEmailAndPassword(
                        email: email, password: pass);
                    if (user.additionalUserInfo.isNewUser == true) {

                      
                      Navigator.pushNamed(context, "chat");
                    }
                    
                  } catch (e) {
                    print(e);
                    
                  }
                  setState(() {
                      
                      sspin = false;
                    });
                },
                child: Text("Register"),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
