import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, this.correctAnswer = 0});
  int correctAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo[700],
        title: Text("نتیجه آزمون"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                "assets/images/cup.png",
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "پاسخ های صحیح شما",
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "$correctAnswer",
              style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
