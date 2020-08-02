import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String title;
  final int height;
  final int weight;

  ResultScreen({this.title, this.height, this.weight});

  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              makeTextResult(widget.height, widget.weight),
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            makeIconResult(makeTextResult(widget.height, widget.weight)),
          ],
        ),
      ),
    );
  }
}

Widget makeIconResult(String result) {
  switch (result) {
    case '고도비만':
      {
        return Icon(
          Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          size: 120,
        );
      }
    case '비만':
      {
        return Icon(
          Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          size: 120,
        );
      }

    case '과체중':
      {
        return Icon(
          Icons.sentiment_dissatisfied,
          color: Colors.yellow,
          size: 120,
        );
      }
    case '정상':
      {
        return Icon(
          Icons.sentiment_satisfied,
          color: Colors.green,
          size: 120,
        );
      }

    case '저체중':
      {
        return Icon(
          Icons.sentiment_dissatisfied,
          color: Colors.yellow,
          size: 120,
        );
      }
  }
}

String makeTextResult(int height, int weight) {
  final textResult = {'고도비만', '비만', '과체중', '정상', '저체중'};
  double heightForCal = height / 100;
  double result = weight / (heightForCal * heightForCal);
  print(result);
  if (result > 30) {
    return textResult.elementAt(0);
  } else if (result <= 30 && result > 25) {
    return textResult.elementAt(1);
  } else if (result <= 25 && result > 23) {
    return textResult.elementAt(2);
  } else if (result <= 23 && result > 18.5) {
    return textResult.elementAt(3);
  } else if (result <= 18.5) {
    return textResult.elementAt(4);
  }
}
