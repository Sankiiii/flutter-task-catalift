import 'package:flutter/material.dart';
import 'package:courses_app/utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isBookmarked;
  final VoidCallback onBackPressed;
  final VoidCallback onBookmarkPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.isBookmarked,
    required this.onBackPressed,
    required this.onBookmarkPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.paddingMedium),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackPressed,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: AppSizes.iconSize,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onBookmarkPressed,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isBookmarked ? AppColors.primary : Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: isBookmarked ? Colors.white : Colors.grey,
                size: AppSizes.iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}