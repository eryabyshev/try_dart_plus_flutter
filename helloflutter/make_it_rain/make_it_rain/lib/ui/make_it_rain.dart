import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {

  int _moneyCounter = 0;
  Color _moneqCounterColor = Colors.greenAccent;

  _doWork() {
    _moneyCounter += 100;
    if(_moneyCounter > 1000) {
      _moneqCounterColor = Colors.redAccent;
    } else {
      _moneqCounterColor = Colors.greenAccent;
    }
  }

  _reset() => setState(() => _moneyCounter = 0);

  _rainMoney() => setState(() => _doWork());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make it Rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Get Rich",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 29.9),
              ),
            ),

            Expanded(
              child: Center(
                child: Text(
                  "${_moneyCounter}\$",
                  style: TextStyle(
                    color: _moneqCounterColor,
                    fontSize: 46.9,
                    fontWeight: FontWeight.w800
                  ),
                )
              ),
            ),


            Expanded(
              child: Center(
                child: FlatButton(
                    onPressed: () => _rainMoney(),
                    color: Colors.lightGreen,
                    textColor: Colors.white70,
                    child: Text(
                      "Let It Rain",
                      style: TextStyle(
                        fontSize: 19.9
                      ),
                    )
                ),
              )
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => _reset(),
          child: Icon(Icons.refresh),

      ),
    );
  }
}
