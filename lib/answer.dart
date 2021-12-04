import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final int opno;
  final String optext;
  final Function selectedOption;
  Answer(
      {required this.opno, required this.optext, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.purple[200],
        onPressed: () => selectedOption(optext),
        child: Text(optext),
      ),
    );
  }
}
