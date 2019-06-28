import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Center(
       child: new Text(
        "Home Screen ",
        style: TextStyle( fontSize: 75, fontStyle: FontStyle.italic),
       ),
      ),
    );
  }
}
