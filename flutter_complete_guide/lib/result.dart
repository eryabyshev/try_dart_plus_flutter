import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String _message;
  final VoidCallback _reset;

  Result(this._message, this._reset);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            _message,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FlatButton(onPressed: _reset, child: Text("Миша давай по-новой"))
      ],
    );
  }
}
