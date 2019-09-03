import "package:flutter/material.dart";
import 'package:quake_app/logic/data_provider.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _response = QuakesDataProvider.getQuakes().then(onValue);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quakes",
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: DataList.getView(_response)
        
    );
  }
}



class DataList {

  static ListView getView(var data) {

    var quakeListFromResponse = QuakesDataProvider.getQuakeListFromResponse(data);

    return ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          return Column(
            children: <Widget>[
              Divider(height: 3),
              ListTile(
                title: Text(""),
                subtitle: Text(""),
              )
            ],
            
          );
        }

    );
  }
  
}

