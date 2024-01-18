// ignore_for_file: use_key_in_widget_constructors, constant_identifier_names

// import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'final_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  static const String KEYVIS = "visited";
  static const String KEYSTR = "strResult";
  void screenToGo() async {
    var sharePref = await SharedPreferences.getInstance();
    var isVis = sharePref.getBool(KEYVIS);
    String res = sharePref.getString(KEYSTR).toString();
    Timer(const Duration(seconds: 2), () {
      if (isVis != null && res != "") {
        if (isVis) {
          print(11);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MyHomePage(title: ' KnowYourBMI ')));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FinalScreen(result: res)));
        } else {
          print(12);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MyHomePage(title: ' KnowYourBMI ')));
        }
      } else {
        print(13);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const MyHomePage(title: ' KnowYourBMI ')));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      screenToGo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xfffdcbf1), Color(0xffe6dee9)])),
      child: Center(
          child: Text(
        "Know Your BMI",
        style: GoogleFonts.getFont('Rubik Bubbles', fontSize: 30),
      )),
    ));
  }
}
