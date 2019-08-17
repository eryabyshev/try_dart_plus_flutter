import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}


class _LoginData {
  String name = "";
  String password = "";
}


class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  _LoginData _data = new _LoginData();

  _submit() {
    if(_formKey.currentState.validate()) {

      setState(() {
        _data.name = _data.name;
      });

      _dismissKeyboard(context);
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("All is good", textDirection: TextDirection.ltr))
      );
    }
  }

  _doClear() {
    _formKey.currentState.reset();
    setState(() {
      _data.name = null;
      _data.password = null;
    });
  }

  String _validateNameField(String value) {
    if(value.isEmpty) {
      return "Please  enter your name";
    }
    _data.name = value;
    return null;
  }

  String _validatePasswordField(String value) {
    if(value.isEmpty) {
      return "Please  enter your password";
    }
    _data.password = value;
    return null;
  }

  _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset(
              "images/face.png",
              width: 60,
              height: 60,
              color: Colors.white70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 70,
              child: TextFormField(
                validator: (value) => _validateNameField(value),
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                        gapPadding: 3.3,
                        borderRadius: BorderRadius.circular(3.3))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 70,
              child: TextFormField(
                obscureText: true,
                validator: (value) => _validatePasswordField(value),
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        gapPadding: 3.3,
                        borderRadius: BorderRadius.circular(3.3),
                    )
                ),

              ),
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () => _submit(),
                    child: Text(
                      "Submit"
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () => _doClear(),
                    child: Text("Clear"),
                  ),
                )
              ],

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                "${_data.name != null ? "Welcome, ${_data.name}" : ""}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 19
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
