import 'package:flutter/material.dart';
import 'package:courses_app/models/course_model.dart';
import 'package:courses_app/utils/constants.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;
  final VoidCallback onBookmarkTap;
  final VoidCallback onAddToCart;

  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
    required this.onBookmarkTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: course.bgColor ?? Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.borderRadius),
                  topRight: Radius.circular(AppSizes.borderRadius),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      course.icon,
                      size: AppSizes.iconSizeLarge,
                      color: Colors.grey[600],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: onBookmarkTap,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: course.isBookmarked
                              ? AppColors.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          course.isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          size: 14,
                          color: course.isBookmarked
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Course Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.price,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      GestureDetector(
                        onTap: onAddToCart,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
