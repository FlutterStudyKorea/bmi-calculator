

import 'package:flutter/material.dart';
import 'package:test_bmical/ResultPage.dart';
import 'package:test_bmical/TextField.dart';

class InputFieldPage extends StatefulWidget {
  @override
  _InputFieldPageState createState() => _InputFieldPageState();
}

class _InputFieldPageState extends State<InputFieldPage> {
  final _formKey = GlobalKey<FormState>();

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI 계산기")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              MyTextFiled(heightController,'키','키 정보를 입력하여 주십시요',true)
            ,
              SizedBox(
                height: 16.0,
              ),
               MyTextFiled(weightController,'몸무게','몸무게 정보를 입력주십시요',true)
              ,
              SizedBox(
                height: 32.0,
              ),
              Container(
                child: Card(
                  color: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0,
                  child: Container(
                    width: 100,
                    height: 50,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          print("클릭 되었습니다.");
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            print("키 : ${heightController.text
                                .trim()} 몸무게 : ${weightController.text
                                .trim()}  ");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResultPage(double.parse(
                                          heightController.text.trim()),
                                          double.parse(
                                              weightController.text.trim()))),
                            );
                          }
                          /*else
                          {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('값을 입력하여 주십시요')));
                          }*/
                        },
                        child: Text("BMI 계산하기"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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

