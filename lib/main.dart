import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InputFieldPage(),
    );
  }
}

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
         child :Column(
          children: <Widget>[
            TextFormField(
              controller: heightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '키',
              ),
              keyboardType: TextInputType.number,

              validator: (value) {
                if (value.trim().isEmpty) {
                  return '키 정보를 입력하여 주십시요';
                }
                return null;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: weightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '몸무게',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return '몸무게 정보를 입력주십시요';
                }
                return null;
              },
            ),
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
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          print("키 : ${heightController.text.trim()} 몸무게 : ${weightController.text.trim()}  ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(double.parse(heightController.text.trim()),double.parse(weightController.text.trim()))),
                          );
                         // Scaffold.of(context).showSnackBar(
                           //   SnackBar(content: Text('값을 입력하여 주십시요')));
                       }
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



