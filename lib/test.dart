import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './result.dart';

class Test extends StatefulWidget {
  final quizTest;
  final Function startQuiz;
  final Function homeScreen;

  Test({this.quizTest, required this.startQuiz, required this.homeScreen});

  String getTestName() {
    // print(quizTest);
    return quizTest['testName'].toString().toUpperCase() + " Quiz";
  }

  @override
  TestState createState() => TestState();
}

class TestState extends State<Test> {
  int score = 0;
  int qindex = 0;
  var temp;
  bool quizOver = false;

  @override
  Widget build(BuildContext context) {
    final ques = widget.quizTest['testData']['ques'];

    void answerChoosen(selectedOp) {
      var co = ques[qindex]['correctAns'];
      // print(selectedOp);
      if (co == selectedOp) {
        setState(() {
          score = score + 10;
        });
      }

      temp = qindex + 1;

      if (temp < ques.length) {
        setState(() {
          qindex++;
        });
      } else {
        setState(() {
          quizOver = true;
        });
      }

      // print(qindex);
      // print(score);
      // print(ques.length);
    }

// restart quiz
    void restartQuiz() {
      setState(() {
        qindex = 0;
        score = 0;
        quizOver = false;
      });
    }

    if (!quizOver) {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    color: Colors.amber),
                child: Text(
                  widget.getTestName(),
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Question(ques[qindex]['qtext']),
              ...(ques[qindex]['options'] as List<Map<String, Object>>)
                  .map((Map<String, dynamic> option) {
                return Answer(
                  opno: option['ono'],
                  optext: option['otext'],
                  selectedOption: answerChoosen,
                );
              }).toList(),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                onPressed: () => widget.homeScreen(),
                child: Text(
                  "HOME",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ));
    } else {
      // result widget goes here..
      return Result(
          restartQuiz: restartQuiz, score: score, goHome: widget.homeScreen);
    }
  }
}
