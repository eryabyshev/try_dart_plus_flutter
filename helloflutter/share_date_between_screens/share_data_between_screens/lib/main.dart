import 'package:flutter/cupertino.dart';
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

  Future _goToNextScreen(BuildContext context) async {
    await Navigator.of(context).push(
        MaterialPageRoute<Map>(
          builder: (BuildContext context) {
            return NextScreen(nameFromPageOne: _nameController.text);
          }
      )
    ).then(_updateTextField);
  }
  
  _updateTextField(Map resultOfWorkOnScreenTwo) {
    if(resultOfWorkOnScreenTwo != null && resultOfWorkOnScreenTwo.containsKey('info')) {
      _nameController.text = resultOfWorkOnScreenTwo['info'];
    }

  }

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
              onPressed: () => _goToNextScreen(context),
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

  var _backToScreenOne = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scree 2"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("${widget.nameFromPageOne}"),
            ),
            ListTile(
              title: TextField(
                controller: _backToScreenOne,
              ),
            ),
            ListTile(
              title: FlatButton(onPressed: () {
                Navigator.pop(context, {"info" : _backToScreenOne.text});
              },
                  child: Text("Send data back")
              ),
            )
          ],
        ),
      )
    );
  }
}

