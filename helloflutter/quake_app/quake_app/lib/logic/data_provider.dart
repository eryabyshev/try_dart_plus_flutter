import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';



class QuakesDataProvider {

  static var _apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  static Future<Map> getQuakes() async {
    Response response = await get(_apiUrl);
    var temp =  json.decode(response.body);
    print(temp["features"]);
    return temp;
  }

  static String getFormatDateFromUTC(int time) {
    var dt = new DateTime.fromMicrosecondsSinceEpoch(time);
    var format = new DateFormat("yMd");
    return format.format(dt);
  }


  static List<QuakeInfo> getQuakeListFromResponse(Map map) {
    List<QuakeInfo> result = new List<QuakeInfo>();
    for(final quake in map["features"]) {
      result.add(new QuakeInfo(quake));
    }
    return result;
  }
}


class QuakeInfo {

  int _data;
  String _place;
  double _mag;

  QuakeInfo(Map entry) {
    _data = entry["time"];
    _place = entry["place"];
    _mag = entry["mag"];
  }
}