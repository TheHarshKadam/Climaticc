import 'package:climaticc/screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:climaticc/screens/home.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF121212),
          appBarTheme: AppBarTheme(color: Color(0xFF121212), elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loading())));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF121212),
    ));
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 210.0,
        ),
        Image(
          image: AssetImage(
            'assets/icon.png',
          ),
          width: 150.0,
          height: 150.0,
        ),
        SizedBox(
          height: 200.0,
        ),
        Text(
          "Climaticc",
          style: GoogleFonts.comfortaa(fontSize: 30.0, color: Colors.grey[350]),
        ),
        SizedBox(
          height: 9.0,
        ),
        Text(
          "By THK",
          style: GoogleFonts.comfortaa(fontSize: 12.0, color: Colors.grey[350]),
        )
      ]),
    ));
  }
}
