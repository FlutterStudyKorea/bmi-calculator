import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double height;
  final double weight;

  const ResultPage(this.height,this.weight);
  @override
  _ResultPageState createState() => _ResultPageState(this.height,this.weight);
}

class _ResultPageState extends State<ResultPage> {

  final double height;
  final double weight;

  _ResultPageState(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100) * (height / 100));

    return Scaffold(
      appBar: AppBar(title: Text("BMI 계산 결과")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.accessibility,
                color: Colors.blue,
                size: 100.0,
              ),
              Text(_calcBmi(bmi),style: TextStyle(fontSize: 40)),
              SizedBox(
                height: 16.0,
              ),
              _buildIcon(bmi),
            ],
          ),
        ),
      ),
    );
  }
  String _calcBmi(double bmi) {
    var result = '저체중';
    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  Widget _buildIcon(double bmi) {
    if (bmi >= 23) {
      return Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      return Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    } else {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.orange,
        size: 100,
      );
    }
  }
}