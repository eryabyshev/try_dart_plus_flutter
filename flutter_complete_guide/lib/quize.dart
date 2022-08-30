import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final String _question;
  final List<String> _answers;
  final VoidCallback _callback;

  const Quiz(this._question, this._answers, this._callback);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(_question),
      ..._answers.map((answer) {
        return Answer(_callback, answer);
      })
    ]);
  }
}
