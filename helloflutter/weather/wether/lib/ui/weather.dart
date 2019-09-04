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

  _updateCity(Map result) {
    if(result['new_city'].toString().isEmpty) {
      return;
    }
    setState(() {
      _city = result['new_city'];
    });
  }

  Widget _updateTemperature(String city) {
    return FutureBuilder(
      future: getWeather(util.apiId, city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if(snapshot.hasData) {
          Map content = snapshot.data;
          if (content["cod"] == 200) {
            return Container(
              alignment: Alignment.bottomLeft,
              child: Text("${content["main"]["temp"].toString()} C",
                  style: getWeatherStyle()),
              margin: EdgeInsets.fromLTRB(50, 0, 0, 100),
            );
          }
        }
        return Container();
      },
    );
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

          _updateTemperature(_city)
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

