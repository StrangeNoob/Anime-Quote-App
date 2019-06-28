import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.blue,
      child: Center(
      child:  new Text(
        "Settings",
        style: TextStyle( fontSize: 75, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
