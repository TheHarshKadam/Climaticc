import 'package:flutter/material.dart';
import 'package:climaticc/screens/home.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFF121212),
            appBarTheme: AppBarTheme(
              color: Color(0xFF121212),
              elevation: 0
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity
          ),
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
            context, MaterialPageRoute(builder: (context) => home())));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF121212),
       )
    );
    return Container(
        color: Color(0xFF121212),
        child: Center(
            child: Image(
          image: AssetImage(
            'assets/icon.png',
          ),
          width: 150.0,
          height: 150.0,
        )));
  }
}
