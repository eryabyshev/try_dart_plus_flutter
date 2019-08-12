
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
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Bonni",
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: Colors.red
              ),
            ),
            InkWell(
              child: Text(
                "Button",
              ),
              onTap: () => debugPrint("press on InkWell element"),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => debugPrint("Yeth buton"),
          backgroundColor: Colors.blue,
          tooltip: "Going up",
          child: Icon(Icons.adb)
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("Say")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.print),
              title: Text("Print")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call_missed),
              title: Text("Missi")
            )
          ],
        onTap: (int i) => debugPrint("$i")
      ),

    );
  }
  
}