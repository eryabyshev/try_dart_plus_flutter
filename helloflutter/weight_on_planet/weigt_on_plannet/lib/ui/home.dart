import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  String planetName = "";
  double _result = 0.0;

  double calculaterWeigt(String weight, double cof) {
    if(weight.isEmpty) return 0;
    final double result = double.parse(weight);
    if(result == 0) return 0;
    return result * cof;
  }

  void handelRadioValueChange(int value) {
    setState(() {
      radioValue = value;
      
      switch(radioValue) {
        case 0:
          _result = calculaterWeigt(_weightController.text, 0.06);
          planetName = "Pluto";
          break;
        case 1:
          _result = calculaterWeigt(_weightController.text, 0.38);
          planetName = "Mars";
          break;
        case 2:
          _result = calculaterWeigt(_weightController.text, 0.91);
          planetName = "Venues";
      }
      
    });
  }

  String getMessage() {
    if(planetName.isNotEmpty) {
      return "Your weight on ${planetName} is ${_result}";
    }
    return "";
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: AppBar(
            title: Text("Weight on planet"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey.shade400,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            padding: const EdgeInsets.all(2.5),
            children: <Widget>[
              Image.asset(
                "images/planet.png",
                height: 100,
                width: 100,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    TextField(
                      onSubmitted: (value) => debugPrint(value),
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Your weight on Earth",
                          hintText: "In kilogramms",
                          icon: Icon(Icons.person_outline)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                      activeColor: Colors.blueAccent,
                      value: 0,
                      groupValue: radioValue,
                      onChanged: handelRadioValueChange
                  ),

                  Text(
                    "Pluto",
                    style: TextStyle(color: Colors.white30),
                  ),

                  Radio<int>(
                      activeColor: Colors.redAccent,
                      value: 1,
                      groupValue: radioValue,
                      onChanged: handelRadioValueChange
                  ),

                  Text(
                    "Mars",
                    style: TextStyle(color: Colors.white30),
                  ),

                  Radio<int>(
                      activeColor: Colors.orangeAccent,
                      value: 2,
                      groupValue: radioValue,
                      onChanged: handelRadioValueChange
                  ),

                  Text(
                    "Venues",
                    style: TextStyle(color: Colors.white30),
                  ),
                ],
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${planetName.isNotEmpty ? "Your weight on ${planetName} is ${_result}" : ""}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }


}
