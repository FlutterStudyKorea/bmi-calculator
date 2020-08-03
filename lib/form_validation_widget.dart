import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormValidationWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController heightController;
  final String warningMsg;
  final String hintMag;

  FormValidationWidget({this.formKey, this.heightController, this.warningMsg, this.hintMag});

  _FormValidationWidgetState createState() => _FormValidationWidgetState();
}

class _FormValidationWidgetState extends State<FormValidationWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return widget.warningMsg;
          }
          return null;
        },
        controller: widget.heightController,
        decoration: InputDecoration(
            hintText: widget.hintMag, border: OutlineInputBorder()),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
