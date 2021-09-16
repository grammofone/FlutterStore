import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SplashScreen extends StatefulWidget {
  final String nextRoute;

  SplashScreen({this.nextRoute});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
        () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeumorphicBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Neumorphic(
                padding: EdgeInsets.all(16),
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: -15,
                ),
                child: Container(
                  padding: EdgeInsets.all(32),
                  child: NeumorphicText(
                    "e",
                    textAlign: TextAlign.center,
                    textStyle: NeumorphicTextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
