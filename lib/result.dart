import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function restartQuiz;
  final Function goHome;
  final int score;
  Result(
      {required this.restartQuiz, required this.score, required this.goHome});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 200),
            Center(
              child: Text(
                "Quiz Completed !",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                '🎉 Congratulations, Your score is ' + score.toString() + ' 🎉',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                  ),
                  onPressed: () => restartQuiz(),
                  child: Text(
                    "RESTART",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  onPressed: () => goHome(),
                  child: Text(
                    "HOME",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
