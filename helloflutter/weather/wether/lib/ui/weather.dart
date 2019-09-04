import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wether/util/utils.dart' as util;
import 'package:http/http.dart';

import 'city.dart';


class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  double _temeratureNow = 0.0;
  String _city = util.defaultCity;

  Future<Map> getWeather(String appId, String city) async{
    var url = "http://api.openweathermap.org/data/2.5/weather?q=${city.replaceAll('-', '+')}&appid=${appId}&units=metric";
    debugPrint(url);
    Response response = await get(url);
    return json.decode(response.body);
  }

  void showStuff() async {
    await getWeather(util.apiId,_city).then(_updateTemperature);
  }

  _updateCity(Map result) {

    if(result['new_city'].toString().isEmpty) {
      return;
    }
    setState(() {
      _city = result['new_city'];
    });
  }

  _updateTemperature(var responce) {
    if(responce != null) {
      setState(() {
        _temeratureNow = responce["main"]["temp"];
      });
    }
  }

  Future _goToChangeCity(BuildContext context) async{
    await Navigator.of(context).push(
      MaterialPageRoute<Map>(builder: (BuildContext context) {
        return ChangeCity();
      })
    ).then((result) => _updateCity(result));
  }

  @override
  Widget build(BuildContext context) {

    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    //showStuff();

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.menu),
              onPressed: () => _goToChangeCity(context)
          ),
          new IconButton(icon: Icon(Icons.update),
              onPressed: () => showStuff()
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset("images/umbrella.png",
                width: Width + 200,
                height: Height,
                fit: BoxFit.fill),
          ),

          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0, 10, 50, 0),
            child: Text(
                "${_city}",
                style: cityStyle()
                ),
          ),

          Container(
            alignment: Alignment.center,
            child: Image.asset("images/light_rain.png"),
          ),

          Container(
            alignment: Alignment.bottomLeft,
            child: Text("${_temeratureNow} C", style: getWeatherStyle()),
            margin: EdgeInsets.fromLTRB(50, 0, 0, 100),
          )
        ],
      ),

    );
  }

  TextStyle cityStyle() {
    return TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold
    );
  }

  TextStyle getWeatherStyle() {
    return TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal
    );
  }

}

