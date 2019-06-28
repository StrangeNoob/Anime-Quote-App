import 'package:flutter/material.dart';

class Editors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child:  new Text(
          "Editors",
          style: TextStyle( fontSize: 75, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
