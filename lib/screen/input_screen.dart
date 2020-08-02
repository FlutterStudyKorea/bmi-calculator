import 'package:bmi_calculator/screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputScreen extends StatefulWidget {
  final String title;

  InputScreen({this.title});

  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Form(
            child: TextField(
              controller: heightController,
              decoration:
                  InputDecoration(hintText: '키', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Form(
            child: TextField(
              controller: weightController,
              decoration: InputDecoration(
                hintText: '몸무게',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RaisedButton(
                child: Text('결과'),
                onPressed: () {
                  int height = int.parse(heightController.text);
                  int weight = int.parse(weightController.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                title: widget.title,
                                height: height,
                                weight: weight,
                              )));
                }),
          )
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
