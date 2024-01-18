// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, constant_identifier_names
// import 'dart:convert';

// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash.dart';
import 'final_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Know Your BMI',
      // theme: ThemeData(fontFamily: 'Schyler'),

      theme: _buildTheme(Brightness.light),
      home: SplashScreen(),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.playfairDisplayTextTheme(baseTheme.textTheme),
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(seedColor: Color.fromRGBO(76, 133, 119, 1)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  // final String result;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // static const String KEYVIS = "visited";
  var cnt1 = TextEditingController();
  var cnt2 = TextEditingController();
  var cnt3 = TextEditingController();
  var result = "Fill Above Required Informations Then Press Button";
  var cat = "";
  var rad = [30, 40, 50, 60];
  double a = 220;
  double b = 110;
  late Animation _anime;
  late AnimationController _animeC;
  late Animation _anime1;
  late AnimationController _animeC1;
  late Animation _anime2;
  late AnimationController _animeC2;
  static const String KEYVIS = "visited";
  static const String KEYSTR = "strResult";

  void func1() {
    _animeC1 = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _anime1 = Tween(begin: 0.0, end: 1.0).animate(_animeC1);
    _animeC1.addListener(() {
      setState(() {});
    });
    _animeC1.forward();
  }

  void func2() {
    _animeC2 = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _anime2 = Tween(begin: 0.0, end: 1.0).animate(_animeC2);
    _animeC2.addListener(() {
      setState(() {});
    });
    _animeC2.forward();
  }

  @override
  void initState() {
    super.initState();
    _animeC = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _anime = Tween(begin: 0.0, end: 1.0).animate(_animeC);
    _animeC1 = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _anime1 = Tween(begin: 0.0, end: 1.0).animate(_animeC1);
    _animeC2 = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _anime2 = Tween(begin: 0.0, end: 1.0).animate(_animeC1);
    _animeC.addListener(() {
      setState(() {});
    });
    _animeC.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(221, 240, 255, 1),
          title: Center(
            child: Text(
              widget.title,
              style: GoogleFonts.getFont('Lato', fontWeight: FontWeight.bold),
            ),
          )),
      body: Center(
          child: Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 233, 231, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 25.0,
                    ),
                  ]),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'BMI',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          TextField(
                            controller: cnt1,
                            decoration: InputDecoration(
                                label: Text('Enter your Weight(in Kgs)'),
                                prefixIcon: Icon(Icons.line_weight)),
                            keyboardType: TextInputType.number,
                          ),
                          customWidget1(rad[0]),
                          customWidget1(rad[1]),
                          customWidget1(rad[2]),
                          customWidget1(rad[3]),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          TextField(
                            controller: cnt2,
                            decoration: InputDecoration(
                                label: Text('Enter your Height(in cms)'),
                                prefixIcon: Icon(Icons.height)),
                            keyboardType: TextInputType.number,
                          ),
                          customWidget2(rad[0]),
                          customWidget2(rad[1]),
                          customWidget2(rad[2]),
                          customWidget2(rad[3]),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          width: 100,
                          height: 40,
                          // color: Color.fromRGBO(244, 243, 238, 1),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(244, 243, 238, 1),
                              boxShadow: [BoxShadow(blurRadius: 25)],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(child: Text('getBMI'))),
                      customWidget(rad[0]),
                      customWidget(rad[1]),
                      customWidget(rad[2]),
                      InkWell(
                        child: customWidget(rad[3]),
                        onTap: () async {
                          var sharePref = await SharedPreferences.getInstance();
                          var wt = cnt1.text.toString();
                          var hgt = cnt2.text.toString();
                          if (wt != "" && hgt != "") {
                            try {
                              double aa = (double.parse(wt) /
                                      (double.parse(hgt) * double.parse(hgt))) *
                                  10000;

                              setState(() {
                                if (aa < 18.5) {
                                  cat = "underweight";
                                  b = 90;
                                } else if (aa < 25) {
                                  cat = "healthy";
                                  b = 95;
                                } else if (aa < 30) {
                                  cat = "overweight";
                                  b = 100;
                                } else if (aa < 40) {
                                  cat = "obesity";
                                  b = 105;
                                } else {
                                  cat = "severe obesity";
                                  b = 110;
                                }
                                result =
                                    "Your BMI is ${aa.toStringAsPrecision(4)}. Your are $cat";
                                sharePref.setBool(KEYVIS, true);
                                sharePref.setString(KEYSTR, result);
                                a = 200;
                                // b = 100;
                              });
                            } catch (e) {
                              setState(() {
                                result = "Please Fill with correct dataTypes";
                                a = 200;
                                b = 115;
                              });
                            }
                          } else {
                            setState(() {
                              result = "Please Fill Above Information First";
                              if (wt == "") {
                                func1();
                              } else {
                                func2();
                              }
                              a = 210;
                              b = 90;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FinalScreen(result: result)));
                          },
                          child: Hero(
                              tag: "abcd",
                              child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  width: a,
                                  height: b,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 240, 201, 1),
                                      borderRadius: BorderRadius.circular(5),
                                      // backgroundBlendMode: BlendMode.color,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10.0,
                                            blurStyle: BlurStyle.solid)
                                      ]),
                                  child: Center(
                                      child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            result,
                                            textAlign: TextAlign.center,
                                          )))))))
                ],
              )))),
    );
  }

  Widget customWidget(rad) {
    return Container(
      width: rad * _anime.value,
      height: rad * _anime.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue
              .withOpacity(1 - double.parse(_anime.value.toString()))),
    );
  }

  Widget customWidget1(rad) {
    return Container(
      width: rad * _anime1.value,
      height: rad * _anime1.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue
              .withOpacity(1 - double.parse(_anime1.value.toString()))),
    );
  }

  Widget customWidget2(rad) {
    return Container(
      width: rad * _anime2.value,
      height: rad * _anime2.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue
              .withOpacity(1 - double.parse(_anime2.value.toString()))),
    );
  }
}
