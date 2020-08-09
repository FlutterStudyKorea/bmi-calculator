import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '비만도 계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InBody(),
    );
  }
}

class InBody extends StatefulWidget {
  @override
  _InBodyState createState() => _InBodyState();
}

class _InBodyState extends State<InBody> {

  final inputKey = TextEditingController();

  void InitState(){
    super.initState();

    inputKey.addListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (text){
                print("에러 $text")
              },
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '키',
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '몸무게',
            )),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InBodyResult()),
              );
            },
            child: const Text('결과', style: TextStyle(fontSize: 20)),
          )
        ],
      ),
    );
  }
}

class InBodyResult extends StatefulWidget {
  @override
  _InBodyResultState createState() => _InBodyResultState();
}

class _InBodyResultState extends State<InBodyResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Center(
        child: Text(
          '정상',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){

        },
        child: new Icon(Icons.play_arrow),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
