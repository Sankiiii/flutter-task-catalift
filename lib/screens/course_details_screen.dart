import 'package:flutter/material.dart';
import 'package:courses_app/models/course_model.dart';
import 'package:courses_app/service/cart_service.dart';
import 'package:courses_app/data/course_data.dart';
import 'package:courses_app/utils/constants.dart';
import 'package:courses_app/widgets/custom_app_bar.dart';
import 'package:courses_app/widgets/course_image_widget.dart';
import 'package:courses_app/widgets/status_badge.dart';
import 'package:courses_app/widgets/course_info_widget.dart';
import 'package:courses_app/widgets/action_buttons.dart';
import 'package:courses_app/widgets/similar_courses_section.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  final CartService _cartService = CartService();
  bool isBookmarked = false;
  String selectedFilter = 'All';
  late List<Course> similarCourses;

  @override
  void initState() {
    super.initState();
    similarCourses = List.from(CourseData.similarCourses);
  }

  @override
  Widget build(BuildContext context) {
    final mainCourse = CourseData.mainCourse;
    final bool isAddedToCart = _cartService.isInCart(mainCourse.title);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom App Bar
              CustomAppBar(
                title: AppStrings.courseDetails,
                isBookmarked: isBookmarked,
                onBackPressed: _handleBackPressed,
                onBookmarkPressed: _handleBookmarkPressed,
              ),

              // Course Image
              CourseImageWidget(icon: mainCourse.icon),

              const SizedBox(height: 20),

              // Status Badge
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMedium,
                ),
                child: StatusBadge(text: AppStrings.highlyEnrolled),
              ),

              const SizedBox(height: 12),

              // Course Information
              CourseInfoWidget(course: mainCourse),

              const SizedBox(height: AppSizes.paddingLarge),

              // Action Buttons
              ActionButtons(
                isAddedToCart: isAddedToCart,
                onAddToCart: _handleAddToCart,
                onBuyNow: _handleBuyNow,
              ),

              const SizedBox(height: AppSizes.paddingXLarge),

              // Similar Courses Section
              SimilarCoursesSection(
                courses: similarCourses,
                filters: CourseData.filters,
                selectedFilter: selectedFilter,
                onFilterSelected: _handleFilterSelected,
                onSeeAllPressed: _handleSeeAllPressed,
                onCoursePressed: _handleCoursePressed,
                onBookmarkPressed: _handleCourseBookmarkPressed,
                onAddToCartPressed: _handleCourseAddToCart,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _handleBackPressed() {
    Navigator.pop(context);
  }

  void _handleBookmarkPressed() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
    _showSnackBar(
      isBookmarked ? 'Course bookmarked!' : 'Bookmark removed',
      isBookmarked ? Colors.green : AppColors.warning,
    );
  }

  void _handleAddToCart() {
    final mainCourse = CourseData.mainCourse;
    final bool wasAdded = _cartService.addToCart(mainCourse.title);

    if (wasAdded) {
      _showSnackBar('Course added to cart!', Colors.green);
    } else {
      _cartService.removeFromCart(mainCourse.title);
      _showSnackBar('Course removed from cart', AppColors.warning);
    }
    setState(() {}); // Refresh to update button state
  }

  void _handleBuyNow() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Purchase Course'),
          content: Text(
            'Proceeding to payment for ${CourseData.mainCourse.title} course (${CourseData.mainCourse.price})',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(
                  'Payment successful! Course enrolled.',
                  Colors.green,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: const Text(
                'Pay Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
    _showSnackBar('Filter applied: $filter', AppColors.primary);
  }

  void _handleSeeAllPressed() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(AppSizes.paddingMedium),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.allSimilarCourses,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: similarCourses.length,
                  itemBuilder: (context, index) {
                    final course = similarCourses[index];
                    return ListTile(
                      leading: Icon(course.icon),
                      title: Text(course.title),
                      subtitle: Text(course.price),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.pop(context);
                        _handleCoursePressed(course);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleCoursePressed(Course course) {
    _showSnackBar('Opening ${course.title} course', AppColors.primary);
    // Here you would navigate to the specific course details
    // Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailsScreen()));
  }

  void _handleCourseBookmarkPressed(Course course) {
    setState(() {
      course.isBookmarked = !course.isBookmarked;
    });
    _showSnackBar(
      course.isBookmarked ? '${course.title} bookmarked!' : 'Bookmark removed',
      course.isBookmarked ? Colors.green : AppColors.warning,
    );
  }

  void _handleCourseAddToCart(Course course) {
    final bool wasAdded = _cartService.addToCart(course.title);
    _showSnackBar(
      wasAdded
          ? '${course.title} added to cart!'
          : '${course.title} already in cart',
      wasAdded ? Colors.green : AppColors.warning,
    );
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
