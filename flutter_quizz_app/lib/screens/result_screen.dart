import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quizz_app/screens/quizz_screen.dart';

import '../models/Category.dart';
import 'category_screen.dart';

class ResultScreen extends StatelessWidget {
  final Category category;
  final int score;
  final List<int> userAnswers;

  const ResultScreen({
    required this.category,
    required this.score,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (score / category.questions.length) * 100;
    String resultMessage;
    Color resultColor;

    if (percentage >= 80) {
      resultMessage = 'Excellent!';
      resultColor = Colors.green;
    } else if (percentage >= 60) {
      resultMessage = 'Good Job!';
      resultColor = Colors.blue;
    } else if (percentage >= 40) {
      resultMessage = 'Keep Practicing!';
      resultColor = Colors.orange;
    } else {
      resultMessage = 'Try Again!';
      resultColor = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
        centerTitle: true,
        backgroundColor: category.color,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Text(
              resultMessage,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: resultColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: category.color.withOpacity(0.1),
                border: Border.all(
                  color: category.color,
                  width: 8,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$score/${category.questions.length}',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: category.color,
                      ),
                    ),
                    Text(
                      '${percentage.toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 20,
                        color: category.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Question Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: category.questions.length,
                itemBuilder: (context, index) {
                  final question = category.questions[index];
                  final userAnswer = userAnswers[index];
                  final isCorrect = userAnswer == question.correctAnswerIndex;

                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                isCorrect ? Icons.check_circle : Icons.cancel,
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Question ${index + 1}: ${question.questionText}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          if (userAnswer >= 0)
                            Text(
                              'Your answer: ${question.options[userAnswer]}',
                              style: TextStyle(
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                          if (!isCorrect && userAnswer >= 0)
                            Text(
                              'Correct answer: ${question.options[question.correctAnswerIndex]}',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(category: category),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: category.color,
                    ),
                    child: Text('Try Again'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryScreen()),
                            (route) => false,
                      );
                    },
                    child: Text('Categories'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}