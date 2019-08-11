import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Firs item",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white
            ),
          ),
          Text(
            "Second item",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.blue
            ),
          ),
          Container(
            color: Colors.red.shade50,
            alignment: Alignment.bottomLeft,
            child: Text(
              "Text in container",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Colors.blue
              ),
            ),
          )
        ],
      )
    );
  }
}