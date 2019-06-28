import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child:  new Text(
          "Favourites",
          style: TextStyle( fontSize: 75, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
