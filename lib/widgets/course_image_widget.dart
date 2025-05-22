import 'package:flutter/material.dart';
import 'package:courses_app/utils/constants.dart';

class CourseImageWidget extends StatelessWidget {
  final IconData icon;
  final double height;

  const CourseImageWidget({
    super.key,
    required this.icon,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      child: Center(
        child: Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),
          ),
          child: Icon(
            icon,
            size: AppSizes.iconSizeLarge,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}