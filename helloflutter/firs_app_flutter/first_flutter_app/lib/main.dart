import 'package:flutter/material.dart';

void main() {
  runApp(

    new Material(
      color: Colors.lightGreenAccent,

      child: new Center(

        child: new Text (
          "Hello from mt firs app again",
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22

          ),
        ),
      )
    )

  );
}