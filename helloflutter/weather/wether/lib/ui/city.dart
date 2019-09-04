import 'package:flutter/material.dart';

class ChangeCity extends StatelessWidget {
  var _selectedCiryController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Change City"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          new ListView(
            children: <Widget>[
              Image.asset(
                  "images/white_snow.png",
                  width: Width + 200,
                  height: Height,
                  fit: BoxFit.fill
              )
            ],
          ),
          ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _selectedCiryController,
                    decoration: InputDecoration(
                        hintText: "Enter City"
                    ),
                  ),
                ),
              ),
              
              FlatButton(onPressed: () => Navigator.pop(context, {'new_city' : _selectedCiryController.text}),
                child: Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green
                )
              )
              
            ],
          )
        ],
      ),
    );
  }
}
