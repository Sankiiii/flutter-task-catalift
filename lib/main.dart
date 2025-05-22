import 'package:flutter/material.dart';
import 'package:courses_app/screens/course_details_screen.dart';

void main() {
  runApp(const CourseApp());
}

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CourseDetailsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}