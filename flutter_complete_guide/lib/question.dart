import 'package:flutter/cupertino.dart';

class Question extends StatelessWidget {
  final String _text;

  Question(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          _text,
          style: TextStyle(
            fontSize: 28.0,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
