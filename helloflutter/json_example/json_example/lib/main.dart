import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

main() async {
  List _data = await getJson();

  runApp(MaterialApp(
      title: "JSON example",
      home: Scaffold(
        appBar: AppBar(
          title: Text("JSON example"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int position) {
              return Column(
                children: <Widget>[
                  Divider(height: 3.4),
                  ListTile(
                    title: Text("Title: ${_data[position]["title"]}"),
                    subtitle: Text("Body: ${_data[position]["body"]}"),
                    leading: CircleAvatar(
                      child: Icon(Icons.print, color: Colors.orangeAccent),
                    ),
                    onTap: () => showTabMenu(context, position, _data),
                  )
                ],
              );
            }),
      )));
}

void showTabMenu(BuildContext context, int position, List data) {
  var alertDialog = new AlertDialog(
    title: Text("${data[position]["title"]}"),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context).pop()
      )
    ],
  );
  showDialog(context: context,
      builder: (BuildContext context) {
      return alertDialog;
  });
}

Future<List> getJson() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');
  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return json.decode(response.body);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
