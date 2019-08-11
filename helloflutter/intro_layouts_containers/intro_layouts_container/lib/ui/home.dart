import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text( "Item 1", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 13)),
          Text( "Item 2", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 13)),
          //fills the available space
          Text( "Item 2", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 13)),
          const Expanded(
              child: Text("Item 3")
          )

        ],
      ),
    );
  }
}