import 'package:flutter/material.dart';
import 'package:courses_app/utils/constants.dart';

class ActionButtons extends StatelessWidget {
  final bool isAddedToCart;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  const ActionButtons({
    Key? key,
    required this.isAddedToCart,
    required this.onAddToCart,
    required this.onBuyNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onAddToCart,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: isAddedToCart ? Colors.green : AppColors.primary,
                ),
                backgroundColor: isAddedToCart
                    ? Colors.green.withOpacity(0.1)
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isAddedToCart ? Icons.check : Icons.shopping_cart_outlined,
                    color: isAddedToCart ? Colors.green : AppColors.primary,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isAddedToCart
                        ? AppStrings.addedToCart
                        : AppStrings.addToCart,
                    style: TextStyle(
                      color: isAddedToCart ? Colors.green : AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: ElevatedButton(
              onPressed: onBuyNow,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    AppStrings.buyNow,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
