import 'package:flutter/material.dart';


void main() {

  runApp(
    MaterialApp(
      title: "Data share",
      home: Home(),
    )
  );
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameController = new TextEditingController();

  void sendNameOnSecondScreen() {
    var router = new MaterialPageRoute(
        builder: (BuildContext context) {
          return NextScreen(nameFromPageOne: _nameController.text);
    });

    Navigator.of(context).push(router);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scree 1"),
        backgroundColor: Colors.blue
      ),

      body: ListView(
        children: <Widget>[
          ListTile(
            title: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Enter name"
              ),
            ),
          ),
          ListTile(
            title: RaisedButton(
              onPressed: () => sendNameOnSecondScreen(),
              child: Text("Send name on next scree")
            ),
          )
        ],
      ),
    );
  }
}



class NextScreen extends StatefulWidget {

  String nameFromPageOne;
  NextScreen({Key key, this.nameFromPageOne}) : super(key : key);

  

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scree 2"),
        backgroundColor: Colors.red,
      ),
      body: ListTile(
        title: Text("${this.widget.nameFromPageOne}"),
         
      ),


    );
  }
}

