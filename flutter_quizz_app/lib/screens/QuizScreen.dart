
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class QuizScreen extends StatefulWidget {
  final Category category;

  const QuizScreen({required this.category});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool isAnswered = false;
  int? selectedAnswerIndex;
  List<int> userAnswers = [];

  // Timer properties
  late Timer _timer;
  int _timeLeft = 30; // 30 seconds per question

  @override
  void initState() {
    super.initState();
    startTimer();
    userAnswers = List.filled(widget.category.questions.length, -1);
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          // Time's up, move to next question
          _timer.cancel();
          if (currentQuestionIndex < widget.category.questions.length - 1) {
            nextQuestion();
          } else {
            navigateToResultScreen();
          }
        }
      });
    });
  }

  void checkAnswer(int selectedIndex) {
    if (isAnswered) return; // Already answered

    setState(() {
      selectedAnswerIndex = selectedIndex;
      isAnswered = true;
      userAnswers[currentQuestionIndex] = selectedIndex;

      if (selectedIndex == widget.category.questions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }
    });

    // Wait for 1 second before moving to next question
    Future.delayed(Duration(seconds: 1), () {
      if (currentQuestionIndex < widget.category.questions.length - 1) {
        nextQuestion();
      } else {
        navigateToResultScreen();
      }
    });
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
      isAnswered = false;
      selectedAnswerIndex = null;
      _timeLeft = 30; // Reset timer
    });
  }

  void navigateToResultScreen() {
    _timer.cancel(); // Stop the timer
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          category: widget.category,
          score: score,
          userAnswers: userAnswers,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }