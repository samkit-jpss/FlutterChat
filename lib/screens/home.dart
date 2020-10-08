import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(""),
          elevation: 0,
        ),
        body: Container(
          
          width: double.infinity,
          height: 400,
          decoration: new BoxDecoration(
            color: Colors.blue,
            boxShadow: [BoxShadow(
              color: Colors.blue,
              blurRadius: 25,
              spreadRadius: 5,
            )],
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100))
            

          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  
                  
                  color: Colors.white,
                  elevation: 10,
                  child: MaterialButton(
                    splashColor: Colors.amber,
                    onPressed: () {
                      Navigator.pushNamed(context, "reg");
                    },
                    child: Text("Registration" , style: GoogleFonts.pacifico(color: Colors.blue),),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                SizedBox(height: 10),
                Material(
                  color: Colors.white,
                  elevation: 10,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "login");
                    },
                    child: Text("Login" , style: GoogleFonts.pacifico(color:Colors.blue),),
                    
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                SizedBox(height: 10),
                Material(
                  color: Colors.white,
                  elevation: 10,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "image");
                    },
                    child: Text("Image Fun" , style: GoogleFonts.pacifico(color:Colors.blue),),
                    
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
              ],
            ),
          ),
        ));
  }
}
