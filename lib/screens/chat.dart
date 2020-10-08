
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  var msgtextcontroller = TextEditingController();

  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;

  String chatmsg;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var signInUser = authc.currentUser.email;

    return Scaffold(
      backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('Chat'),
          actions: [
            IconButton(icon: Icon(Icons.close), onPressed: ()
            {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "home");

            },)
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                builder: (context, snapshot) {
                  print('new data comes');

                  var msg = snapshot.data.docs;
                  // print(msg);
                  // print(msg[0].data());
                   
                  List<Widget> y = [];
                  for (var d in msg) {
                    // print(d.data()['sender']);
                    var msgText = d.data()['message'];
                    var msgSender = d.data()['sender'];
                    var msgWidget = Text("$msgText : $msgSender"  , style: GoogleFonts.lato(),);

                    y.add(msgWidget);
                  }

                  print(y);

                  return Container(
                    child: Column(
                      children: y,
                    ),
                  );
                },
                stream: fs.collection("chat").snapshots(),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    width: deviceWidth * 0.70,
                    child: TextField(
                      controller: msgtextcontroller,
                      decoration: InputDecoration(hintText: 'Enter msg ..'),
                      onChanged: (value) {
                        chatmsg = value;
                      },
                    ),
                  ),
                  Container(
                    width: deviceWidth * 0.20,
                    child: FlatButton(
                      child: Icon(Icons.send , color: Colors.blue,),
                      onPressed: () async {
                        msgtextcontroller.clear();

                        await fs.collection("chat").add({
                          "message": chatmsg,
                          "sender": signInUser,
                        });
                        print(signInUser);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
