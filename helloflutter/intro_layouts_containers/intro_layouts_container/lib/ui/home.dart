import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Text(
        "Hello, container",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 14
        ),
      ),
    );
  }
}