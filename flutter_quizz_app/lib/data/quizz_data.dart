// Create a class to manage all quiz data
import 'package:flutter/material.dart';

import '../models/Category.dart';
import '../models/question.dart';

class QuizData {
  static List<Category> getCategories() {
    return [
      Category(
        name: 'Science',
        description: 'Test your knowledge of scientific facts',
        color: Colors.blue,
        icon: Icons.science,
        questions: [
          Question(
            questionText: 'What is the chemical symbol for gold?',
            options: ['Au', 'Ag', 'Fe', 'Go'],
            correctAnswerIndex: 0,
          ),
          Question(
            questionText: 'Which planet is known as the Red Planet?',
            options: ['Venus', 'Jupiter', 'Mars', 'Saturn'],
            correctAnswerIndex: 2,
          ),
          Question(
            questionText: 'What is the largest organ in the human body?',
            options: ['Heart', 'Liver', 'Skin', 'Brain'],
            correctAnswerIndex: 2,
          ),
          Question(
            questionText: 'What is the hardest natural substance on Earth?',
            options: ['Gold', 'Iron', 'Diamond', 'Platinum'],
            correctAnswerIndex: 2,
          ),
          Question(
            questionText: 'Which gas do plants absorb from the atmosphere?',
            options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      Category(
        name: 'History',
        description: 'Challenge yourself with historical facts',
        color: Colors.red,
        icon: Icons.history,
        questions: [
          Question(
            questionText: 'Who was the first President of the United States?',
            options: ['Thomas Jefferson', 'George Washington', 'Abraham Lincoln', 'John Adams'],
            correctAnswerIndex: 1,
          ),
          Question(
            questionText: 'In which year did World War II end?',
            options: ['1943', '1944', '1945', '1946'],
            correctAnswerIndex: 2,
          ),
          Question(
            questionText: 'Which ancient civilization built the pyramids?',
            options: ['Romans', 'Greeks', 'Mayans', 'Egyptians'],
            correctAnswerIndex: 3,
          ),
          Question(
            questionText: 'Who painted the Mona Lisa?',
            options: ['Leonardo da Vinci', 'Pablo Picasso', 'Vincent van Gogh', 'Michelangelo'],
            correctAnswerIndex: 0,
          ),
          Question(
            questionText: 'The French Revolution began in which year?',
            options: ['1789', '1769', '1799', '1809'],
            correctAnswerIndex: 0,
          ),
        ],
      ),
      Category(
        name: 'Geography',
        description: 'Test your knowledge of world geography',
        color: Colors.green,
        icon: Icons.public,
        questions: [
          Question(
            questionText: 'What is the capital of Australia?',
            options: ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
            correctAnswerIndex: 2,
          ),
          Question(
            questionText: 'Which is the largest ocean on Earth?',
            options: ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
            correctAnswerIndex: 3,
          ),
          Question(
            questionText: 'What is the longest river in the world?',
            options: ['Amazon', 'Nile', 'Mississippi', 'Yangtze'],
            correctAnswerIndex: 1,
          ),
          Question(
            questionText: 'Which country has the largest population?',
            options: ['India', 'United States', 'China', 'Russia'],
            correctAnswerIndex: 0,
          ),
          Question(
            questionText: 'What is the tallest mountain in the world?',
            options: ['K2', 'Mount Everest', 'Kangchenjunga', 'Lhotse'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      Category(
        name: 'Technology',
        description: 'Challenge your tech knowledge',
        color: Colors.purple,
        icon: Icons.computer,
        questions: [
          Question(
            questionText: 'Who is the founder of Microsoft?',
            options: ['Steve Jobs', 'Bill Gates', 'Elon Musk', 'Mark Zuckerberg'],
            correctAnswerIndex: 1,
          ),
          Question(
            questionText: 'What does CPU stand for?',
            options: ['Central Processing Unit', 'Computer Personal Unit', 'Central Processor Unit', 'Central Program Unit'],
            correctAnswerIndex: 0,
          ),
          Question(
            questionText: 'Which programming language is used for Flutter development?',
            options: ['Java', 'Swift', 'Kotlin', 'Dart'],
            correctAnswerIndex: 3,
          ),
          Question(
            questionText: 'What is the main function of an operating system?',
            options: ['Run applications', 'Manage hardware and software resources', 'Connect to the internet', 'Play games'],
            correctAnswerIndex: 1,
          ),
          Question(
            questionText: 'Which company developed the first iPhone?',
            options: ['Samsung', 'Google', 'Microsoft', 'Apple'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ];
  }
}