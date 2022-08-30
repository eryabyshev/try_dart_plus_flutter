import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quize.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _question = [
    {
      "questionText": "твой лучший братюня?",
      "answers": ["Женек", "Жендос", "Евгений Рябышев"]
    },
    {
      "questionText": "ну че мутим игруху?",
      "answers": ["Ага", "кк", "Конечно", "Погнали"]
    }
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
    });
  }

  Widget _nextWidget() {
    if (_questionIndex == _question.length) {
      return Result("Ну все!!!", _reset);
    } else {
      return Quiz(
          _question[_questionIndex]["questionText"] as String,
          _question[_questionIndex]["answers"] as List<String>,
          _answerQuestion);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GanZ question"),
        ),
        body: Container(
          child: _nextWidget(),
        ),
      ),
    );
  }
}
