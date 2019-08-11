
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Welcome",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            fontSize: 34.5
          ),
        ),
      ),
    );
  }


}