import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_quizz_app/models/question.dart';

class Category {
  final String name;
  final String description;
  final Color color;
  final IconData icon;
  final List<Question> questions;

  Category({
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
    required this.questions,
  });
}