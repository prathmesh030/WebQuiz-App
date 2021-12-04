import 'package:flutter/material.dart';

import './test.dart';

class Home extends StatelessWidget {
  final quizTest;
  final Function startQuiz;
  final Function goToHome;

  Home({this.quizTest, required this.startQuiz, required this.goToHome});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ...(quizTest['tests'] as List<Map<String, Object>>).map((test) {
            var testName = test['testName'].toString();
            return Container(
              width: double.infinity,
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red),
              child: RaisedButton(
                padding: EdgeInsets.all(20),
                color: Colors.red,
                onPressed: () => startQuiz(Test(
                    quizTest: test,
                    startQuiz: startQuiz,
                    homeScreen: goToHome)),
                child: Text(
                  testName.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
