
import 'package:flutter/material.dart';

class Home extends StatelessWidget {


  _getMessage({buttonName: 'send'}) {
    debugPrint("Has pressed button ${buttonName}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent.shade700,
        title: Text("Fency Day"),
        actions: <Widget>[
          IconButton (
            icon: Icon(Icons.send),
            onPressed: _getMessage,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _getMessage(buttonName: 'serch'),
          )
        ],
      ),
    );
  }
  
}