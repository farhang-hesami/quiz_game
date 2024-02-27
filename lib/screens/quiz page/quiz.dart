import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/constants/constants.dart';
import 'package:flutter_application_quiz/data/Question.dart';
import 'package:flutter_application_quiz/screens/result%20page/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int shownQuestionIndex = 0;
  Question? selectedQuestion;
  bool isFinalAnswerSumbited = false;
  int correctAnswer = 0;
  @override
  Widget build(BuildContext context) {
    selectedQuestion = getQuestionsList()[shownQuestionIndex];
    String questionImageIndex =
        getQuestionsList()[shownQuestionIndex].imageNameNubmer!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo[700],
        title: Text(
            " سوال ${shownQuestionIndex + 1} از ${getQuestionsList().length}"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            Image.asset(
              "assets/images/$questionImageIndex.png",
              height: 300.0,
            ),
            SizedBox(height: 25.0),
            Text(
              selectedQuestion!.questionTitle!,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25.0,
            ),
            ...List.generate(
              4,
              (index) => getOptionsItem(index),
            ),
            SizedBox(height: 12.0),
            if (isFinalAnswerSumbited)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[700],
                  elevation: 0.0,
                  minimumSize: Size(200.0, 45.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen(
                        correctAnswer: correctAnswer,
                      );
                    },
                  ));
                },
                child: Text(
                  "مشاهده نتایج",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget getOptionsItem(int index) {
    return ListTile(
      title: Text(
        selectedQuestion!.answerList![index],
        textAlign: TextAlign.end,
      ),
      onTap: () {
        if (selectedQuestion!.correctAnswer == index) {
          correctAnswer++;
        } else {
          print("wrong");
        }
        if (shownQuestionIndex == getQuestionsList().length - 1) {
          isFinalAnswerSumbited = true;
        }
        setState(() {
          if (shownQuestionIndex < getQuestionsList().length - 1) {
            shownQuestionIndex++;
          }
        });
      },
    );
  }
}
