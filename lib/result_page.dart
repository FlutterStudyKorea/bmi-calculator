import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  ResultPageArguments arguments;

  ResultPage(this.arguments);

  @override
  StateResultPage createState() {
    return StateResultPage(height: arguments.height, weight: arguments.weight);
  }
}

class StateResultPage extends State<ResultPage> {
  String height;
  String weight;
  BmiStatus status;

  StateResultPage({this.height, this.weight});

  @override
  void initState() {
    status = BmiCalculator().calculate(this.height, this.weight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 측정기')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              status.result,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Icon(
              status.icon,
              size: 150,
              color: status.color,
            ),
          ],
        ),
      ),
    );
  }
}

class BmiCalculator {
  double _getBmi(String height, String weight) {
    double weightValue = double.parse(weight);
    double heightValue = double.parse(height);
    return weightValue / ((heightValue / 100) * (heightValue / 100));
  }

  BmiStatus calculate(String height, String weight) {
    double bmi = _getBmi(height, weight);
    var result = BmiStatus.LOW_WEIGHT;
    if (bmi >= 35) {
      result = BmiStatus.HIGH_WARNING_WEIGHT;
    } else if (bmi >= 30) {
      result = BmiStatus.SECOND_WARNING_WEIGHT;
    } else if (bmi >= 25) {
      result = BmiStatus.FIRST_WARNING_WEIGHT;
    } else if (bmi >= 23) {
      result = BmiStatus.WARNING_WEIGHT;
    } else if (bmi >= 18.5) {
      result = BmiStatus.NORMAL;
    }
    return result;
  }
}

enum BmiStatus {
  LOW_WEIGHT,
  HIGH_WARNING_WEIGHT,
  SECOND_WARNING_WEIGHT,
  FIRST_WARNING_WEIGHT,
  WARNING_WEIGHT,
  NORMAL
}

extension BmiStatusExtension on BmiStatus {
  String get result {
    switch (this) {
      case BmiStatus.LOW_WEIGHT:
        return '저체중';
      case BmiStatus.HIGH_WARNING_WEIGHT:
        return '고도 비만';
      case BmiStatus.SECOND_WARNING_WEIGHT:
        return '2단계 비만';
      case BmiStatus.FIRST_WARNING_WEIGHT:
        return '1단계 비만';
      case BmiStatus.WARNING_WEIGHT:
        return '과체중';
      case BmiStatus.NORMAL:
        return '정상';
    }
  }

  IconData get icon {
    switch (this) {
      case BmiStatus.LOW_WEIGHT:
        return Icons.sentiment_dissatisfied;
      case BmiStatus.HIGH_WARNING_WEIGHT:
      case BmiStatus.SECOND_WARNING_WEIGHT:
      case BmiStatus.FIRST_WARNING_WEIGHT:
      case BmiStatus.WARNING_WEIGHT:
        return Icons.sentiment_very_dissatisfied;
      case BmiStatus.NORMAL:
        return Icons.sentiment_satisfied;
    }
  }

  Color get color {
    switch (this) {
      case BmiStatus.LOW_WEIGHT:
        return Colors.orange;
      case BmiStatus.HIGH_WARNING_WEIGHT:
      case BmiStatus.SECOND_WARNING_WEIGHT:
      case BmiStatus.FIRST_WARNING_WEIGHT:
      case BmiStatus.WARNING_WEIGHT:
        return Colors.red;
      case BmiStatus.NORMAL:
        return Colors.green;
    }
  }
}

class ResultPageArguments {
  final String height;
  final String weight;

  ResultPageArguments(this.height, this.weight);
}
