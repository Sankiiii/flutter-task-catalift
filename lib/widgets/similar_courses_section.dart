import 'package:flutter/material.dart';
import 'package:courses_app/models/course_model.dart';
import 'package:courses_app/widgets/course_card.dart';
import 'package:courses_app/widgets/filter_chip_widget.dart';
import 'package:courses_app/utils/constants.dart';

class SimilarCoursesSection extends StatelessWidget {
  final List<Course> courses;
  final List<String> filters;
  final String selectedFilter;
  final Function(String) onFilterSelected;
  final VoidCallback onSeeAllPressed;
  final Function(Course) onCoursePressed;
  final Function(Course) onBookmarkPressed;
  final Function(Course) onAddToCartPressed;

  const SimilarCoursesSection({
    super.key,
    required this.courses,
    required this.filters,
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.onSeeAllPressed,
    required this.onCoursePressed,
    required this.onBookmarkPressed,
    required this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingMedium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStrings.similarCourses,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: onSeeAllPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    AppStrings.seeAll,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Filter Chips
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingMedium,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((filter) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChipWidget(
                    label: filter,
                    isSelected: selectedFilter == filter,
                    onTap: () => onFilterSelected(filter),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Course Cards
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium,
            ),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CourseCard(
                  course: courses[index],
                  onTap: () => onCoursePressed(courses[index]),
                  onBookmarkTap: () => onBookmarkPressed(courses[index]),
                  onAddToCart: () => onAddToCartPressed(courses[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
