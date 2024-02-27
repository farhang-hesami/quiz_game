import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/screens/quiz%20page/quiz.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo[700],
        title: Text("Let's Quiz"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/welcome.png"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                backgroundColor: Colors.indigo[700],
                minimumSize: Size(200.0, 40.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QuizScreen();
                    },
                  ),
                );
              },
              child: Text(
                "Start Game",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
