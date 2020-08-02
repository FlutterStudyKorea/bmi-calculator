import 'package:flutter/material.dart';
import 'package:flutter_app/input_page.dart';
import 'package:flutter_app/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (routeSetting) {
        if (routeSetting.name == '/result') {
          ResultPageArguments arguments = routeSetting.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return ResultPage(arguments);
            },
          );
        }
        return null;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InputPage(),
      routes: {
        '/first': (context) => InputPage(),
      },
    );
  }
}