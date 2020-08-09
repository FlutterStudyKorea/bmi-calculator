import 'package:flutter/material.dart';


class MyTextFiled extends StatefulWidget {
  @override
  final String hint;
  final String validateStr;
  final bool isAutoFocus;
  final TextEditingController textCtrl;
  const MyTextFiled(this.textCtrl,this.hint,this.validateStr,this.isAutoFocus);

  _MyTextFiledState createState() => _MyTextFiledState(this.textCtrl,this.hint,this.validateStr,this.isAutoFocus);
}

class _MyTextFiledState extends State<MyTextFiled> {

  final String hint;
  final String validateStr;
  final bool isAutoFocus;
  final TextEditingController textCtrl;
  _MyTextFiledState(this.textCtrl,this.hint,this.validateStr,this.isAutoFocus);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textCtrl,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
      )

      ,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value
            .trim()
            .isEmpty) {
          return validateStr ;
        }
        return null;
      },
    );
  }
}