import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyLogin extends StatefulWidget {
  MyLogin({Key key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  String email;
  String pass;
  bool sspin = false;
  var authc = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: sspin,
        child: Center(
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
                    var user = await authc.signInWithEmailAndPassword(
                        email: email, password: pass);
                    if (user.additionalUserInfo.isNewUser == false) {
                      Navigator.pushNamed(context, "chat");
                    }
                  
                    setState(() {
                      sspin = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("Login"),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
