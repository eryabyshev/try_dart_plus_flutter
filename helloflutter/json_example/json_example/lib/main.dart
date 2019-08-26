import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';



main() async {

  var _data = await getJson();
  print("${_data}");
  runApp(
      MaterialApp(
        title: "JSON example",
        home: Scaffold(
          appBar: AppBar(
            title: Text("JSON example"),
            backgroundColor: Colors.orangeAccent,
          ),
        ),
      )
  );
}

Future<String> getJson() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return response.body;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}