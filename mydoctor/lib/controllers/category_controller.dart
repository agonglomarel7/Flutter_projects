
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryController {
  static List<Category> getCategories() {
    return [
      Category(
        title: 'Check-up',
        icon: Icons.health_and_safety,
        backgroundColor: Colors.blue,
      ),
      Category(
        title: 'Cardio',
        icon: Icons.favorite,
        backgroundColor: Colors.redAccent,
      ),
      Category(
        title: 'Eyes',
        icon: Icons.remove_red_eye,
        backgroundColor: Colors.cyan,
      ),
      Category(
        title: 'ACL',
        icon: Icons.hail_outlined,
        backgroundColor: Colors.green,
      ),
      Category(
        title: 'Dental',
        icon: Icons.medical_services,
        backgroundColor: Colors.green,
      ),
    ];
  }
}
