import 'package:bmi_calculator/form_validation_widget.dart';
import 'package:bmi_calculator/screen/result_screen.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  final String title;

  InputScreen({this.title});

  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          FormValidationWidget(
              formKey: _formKey,
              heightController: heightController,
              warningMsg: '키를 입력해주세요',
              hintMag: '키'),
          SizedBox(
            height: 8.0,
          ),
          FormValidationWidget(
              formKey: _formKey2,
              heightController: weightController,
              warningMsg: '몸무게를 입력해주세요',
              hintMag: '몸무게'),
          SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RaisedButton(
                child: Text('결과'),
                onPressed: () {
                  int height;
                  int weight;

                  if (_formKey.currentState.validate() && _formKey2.currentState.validate()) {
                    height = int.parse(heightController.text);
                    weight = int.parse(weightController.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  title: widget.title,
                                  height: height,
                                  weight: weight,
                                )));
                  }
                }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}
