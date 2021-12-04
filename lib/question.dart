import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String queText;

  Question(this.queText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      color: Colors.purple,
      child: Text(
        queText,
        style: TextStyle(fontSize: 18, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
