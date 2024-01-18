// ignore_for_file: use_key_in_widget_constructors

// import 'package:flutter/cupertino.dart';
// import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'main.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key, required this.result});
  final String result;
  @override
  State<StatefulWidget> createState() {
    return _FinalScreen();
  }
}

class _FinalScreen extends State<FinalScreen> {
  var result = "";

  @override
  void initState() {
    super.initState();
    result = widget.result;
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => const MyHomePage(title: 'KnowYourBMI ')));
    // });
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
          child: Hero(
              tag: "abcd",
              child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(240, 240, 201, 1),
                      borderRadius: BorderRadius.circular(5),
                      // backgroundBlendMode: BlendMode.color,
                      boxShadow: const [
                        BoxShadow(blurRadius: 10.0, blurStyle: BlurStyle.solid)
                      ]),
                  child: Center(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            result,
                            textAlign: TextAlign.center,
                          )))))),
    ));
  }
}
