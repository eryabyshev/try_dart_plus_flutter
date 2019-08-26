import 'package:bmi_app/logic/bmi.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _bmi = new BMI(0, 0);
  var _ageTextFieldControlle = new TextEditingController();
  var _heightTextFieldController = new TextEditingController();
  var _weightTextFieldController = new TextEditingController();
  
  var _infoAboutIndex = "";
  var _infoAboutCategory = "";

  getResult() {

    setState(() {
      var tryParseHeight = double.tryParse(_heightTextFieldController.text);
      if(tryParseHeight == null || tryParseHeight == 0) return;
      var tryParseWeight = double.tryParse(_weightTextFieldController.text);
      if(tryParseWeight == null || tryParseWeight == 0) return;

      _bmi.weight = tryParseWeight;
      _bmi.height = tryParseHeight;

      var index = _bmi.getIndex();
      if(index < 0) return;

      _infoAboutIndex = "Yout BMI : ${index.toStringAsFixed(2)}";
      _infoAboutCategory = _bmi.getCatergory(index);
    });

  }
  

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "images/logo.png",
              height: 100,
              width: 140,
            ),
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _ageTextFieldControlle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Age",
                          icon: Icon(Icons.person, color: Colors.purple),
                          focusColor: Colors.purple,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.purple,
                          )),
                        ),
                      ),

                      TextField(
                        controller: _heightTextFieldController,
                        keyboardType: TextInputType.number,
                        //onChanged: (value) => _bmi.height ??= double.tryParse(value),
                        decoration: InputDecoration(
                          hintText: "Height in meters",
                          icon: Icon(Icons.unfold_more, color: Colors.purple),
                          focusColor: Colors.purple,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.purple,
                          )),
                        ),
                      ),


                      TextField(
                        controller: _weightTextFieldController,
                        keyboardType: TextInputType.number,
                        //onChanged: (value) => _bmi.weight ??= double.tryParse(value),
                        decoration: InputDecoration(
                          hintText: "Weight in kg",
                          icon: Icon(Icons.line_weight, color: Colors.purple),
                          focusColor: Colors.purple,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                              )),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          onPressed: () => getResult(),
                          color: Colors.purple,
                          child: Text(
                              'Calculate',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        _infoAboutIndex,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 30,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        _infoAboutCategory,
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 30
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
