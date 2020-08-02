import 'package:flutter/material.dart';
import 'package:flutter_app/result_page.dart';

class InputPage extends StatefulWidget {
  @override
  StateInputPage createState() {
    return StateInputPage();
  }
}

class StateInputPage extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  String height = '';
  String weight = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              child: TextFormField(
                validator: (value) {
                  height = value;
                  if (isDouble(value)) {
                    return null;
                  } else {
                    return '키를 입력하세요';
                  }
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              padding: const EdgeInsets.all(8.0),
            ),
            Padding(
              child: TextFormField(
                validator: (value) {
                  weight = value;
                  if (isDouble(value)) {
                    return null;
                  } else {
                    return '몸무게를 입력하세요';
                  }
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              padding: const EdgeInsets.all(8.0),
            ),
            Padding(
              child: Align(
                child: RaisedButton(
                  child: Text('결과'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await Navigator.pushNamed(context, '/result',
                          arguments: ResultPageArguments(height, weight));
                    }
                  },
                ),
                alignment: Alignment.topRight,
              ),
              padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
            )
          ],
        ),
      ),
    );
  }

  bool isDouble(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
