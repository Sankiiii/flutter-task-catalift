import 'package:flutter/material.dart';

class Course {
  final String title;
  final String price;
  final Color? bgColor;
  final IconData icon;
  bool isBookmarked;
  final double rating;
  final int enrolledCount;
  final String description;

  Course({
    required this.title,
    required this.price,
    this.bgColor,
    required this.icon,
    this.isBookmarked = false,
    this.rating = 0.0,
    this.enrolledCount = 0,
    this.description = '',
  });
}