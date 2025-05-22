import 'package:flutter/material.dart';
import 'package:courses_app/models/course_model.dart';

class CourseData {
  static final Course mainCourse = Course(
    title: 'Artificial Intelligence',
    price: '₹1500',
    rating: 4.6,
    enrolledCount: 8374,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    icon: Icons.psychology,
  );

  static final List<Course> similarCourses = [
    Course(
      title: 'Artificial Intelligence and ML',
      price: '₹1,500',
      bgColor: Colors.purple[100],
      icon: Icons.psychology,
    ),
    Course(
      title: 'User Interface and User Experience',
      price: '₹1,500',
      bgColor: Colors.grey[100],
      icon: Icons.design_services,
    ),
    Course(
      title: 'Computer Engineering',
      price: '₹1,500',
      bgColor: Colors.blue[100],
      icon: Icons.computer,
    ),
    Course(
      title: 'Digital Marketing',
      price: '₹1,200',
      bgColor: Colors.orange[100],
      icon: Icons.campaign,
    ),
    Course(
      title: 'Data Science',
      price: '₹1,800',
      bgColor: Colors.green[100],
      icon: Icons.analytics,
    ),
  ];

  static final List<String> filters = [
    'All',
    'AI & ML',
    'Product',
    'Sales',
    'Public Speaking',
    'Engineering'
  ];
}