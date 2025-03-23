import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizz_app/screens/result_screen.dart';

import '../models/Category.dart';

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

  @override
  Widget build(BuildContext context) {
    final question = widget.category.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: true,
        backgroundColor: widget.category.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question ${currentQuestionIndex + 1}/${widget.category.questions.length}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _timeLeft > 10 ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.timer, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Text(
                        '$_timeLeft s',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / widget.category.questions.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(widget.category.color),
            ),
            const SizedBox(height: 32),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  question.questionText,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  bool isCorrect = index == question.correctAnswerIndex;
                  bool isSelected = index == selectedAnswerIndex;
                  Color? backgroundColor;

                  if (isAnswered) {
                    if (isCorrect) {
                      backgroundColor = Colors.green[100];
                    } else if (isSelected) {
                      backgroundColor = Colors.red[100];
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Card(
                      color: backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isSelected ?
                          (isCorrect ? Colors.green : Colors.red) :
                          Colors.grey.withOpacity(0.3),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () => checkAnswer(index),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected ?
                                  (isCorrect ? Colors.green : Colors.red) :
                                  widget.category.color.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + index), // A, B, C, D
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : widget.category.color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  question.options[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                              if (isAnswered)
                                Icon(
                                  isCorrect ? Icons.check_circle : Icons.cancel,
                                  color: isCorrect ? Colors.green : Colors.red,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}