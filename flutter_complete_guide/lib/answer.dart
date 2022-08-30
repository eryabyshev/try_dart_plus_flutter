import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback _call;
  final String answer;

  Answer(this._call, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent, //change background color of button
            onPrimary: Colors.white, //change text color of button
          ),
          onPressed: _call,
          child: Text(answer)),
    );
  }
}
