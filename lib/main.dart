import 'package:flutter/material.dart';

import './home.dart';

void main() {
  runApp(WebQuizApp());
}

class WebQuizApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebDev Quiz',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'WebDev Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // all tests questions are here
  var _web = {
    'tests': [
      {
        'testName': 'HTML',
        'testData': {
          'ques': [
            {
              'qtext': "What does HTML stands for?",
              'options': [
                {'ono': 1, 'otext': "Hypertext Machine language."},
                {'ono': 2, 'otext': "Hypertext and links markup language."},
                {'ono': 3, 'otext': "Hypertext Markup Language."},
                {'ono': 4, 'otext': "Hightext machine language."},
              ],
              'correctAns': 'Hypertext Markup Language.'
            },
            {
              'qtext': "How is document type initialized in HTML5?",
              'options': [
                {'ono': 1, 'otext': "</DOCTYPE HTML>"},
                {'ono': 2, 'otext': "</DOCTYPE>"},
                {'ono': 3, 'otext': "</DOCTYPE html>"},
                {'ono': 4, 'otext': "<!DOCTYPE HTML>"},
              ],
              'correctAns': '<!DOCTYPE HTML>'
            },
            {
              'qtext':
                  "Which of the following HTML element is used for creating an unordered list?",
              'options': [
                {'ono': 1, 'otext': "<unorder-list>"},
                {'ono': 2, 'otext': "<ul>"},
                {'ono': 3, 'otext': "<ol>"},
                {'ono': 4, 'otext': "<uo>"},
              ],
              'correctAns': '<ul>'
            }
          ],
        }
      },
      {
        'testName': 'CSS',
        'testData': {
          'ques': [
            {
              'qtext': "what is full form of CSS?",
              'options': [
                {'ono': 1, 'otext': "Casacading styles"},
                {'ono': 2, 'otext': "Casacading style sheet"},
                {'ono': 3, 'otext': "Casacading super style"},
                {'ono': 4, 'otext': "Casacading short style"},
              ],
              'correctAns': 'Casacading style sheet'
            },
            {
              'qtext': "ID attribute in css denoted by:",
              'options': [
                {'ono': 1, 'otext': "%"},
                {'ono': 2, 'otext': "*"},
                {'ono': 3, 'otext': "#"},
                {'ono': 4, 'otext': "!"},
              ],
              'correctAns': '#'
            },
            {
              'qtext': "bgcolor stands for",
              'options': [
                {'ono': 1, 'otext': "background"},
                {'ono': 2, 'otext': "color background"},
                {'ono': 3, 'otext': "background colorful"},
                {'ono': 4, 'otext': "background color"},
              ],
              'correctAns': 'background color'
            }
          ],
        }
      },
      {
        'testName': 'JAVASCRIPT',
        'testData': {
          'ques': [
            {
              'qtext': "Inside which HTML element do we put the JavaScript?",
              'options': [
                {'ono': 1, 'otext': "<javascript>"},
                {'ono': 2, 'otext': "<script>"},
                {'ono': 3, 'otext': "<html>"},
                {'ono': 4, 'otext': "<scripting>"},
              ],
              'correctAns': '<script>'
            },
            {
              'qtext':
                  "The external JavaScript file must contain the <script> tag.",
              'options': [
                {'ono': 1, 'otext': "True"},
                {'ono': 2, 'otext': "False"},
              ],
              'correctAns': 'False'
            },
            {
              'qtext': "The \"function\" and \"var\" are known as:",
              'options': [
                {'ono': 1, 'otext': "Keywords"},
                {'ono': 2, 'otext': "Prototype"},
                {'ono': 3, 'otext': "Declaration statements"},
                {'ono': 4, 'otext': "Data types"},
              ],
              'correctAns': 'Declaration statements'
            },
          ],
        }
      }
    ]
  };

// show widget on home screen
  var displayWidget;

// go to home
  void goToHome() {
    setState(() {
      displayWidget = null;
    });
  }

// start course quiz
  Widget _startQuiz(test) {
    print(test);
    setState(() {
      if (test != null) {
        displayWidget = test;
      } else {
        displayWidget =
            Home(quizTest: _web, startQuiz: _startQuiz, goToHome: goToHome);
      }
    });
    return displayWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: _startQuiz(displayWidget));
  }
}
