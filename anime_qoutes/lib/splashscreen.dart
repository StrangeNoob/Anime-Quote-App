import 'dart:async';
import 'package:flutter/material.dart';
import './main.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5 ), onDoneLoading);
  }
  onDoneLoading() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splashscreen.gif'),
            fit: BoxFit.cover
        ) ,
      ),

    );
  }
}