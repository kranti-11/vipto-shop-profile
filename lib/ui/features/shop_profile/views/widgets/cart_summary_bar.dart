import 'package:flutter/material.dart';
import 'package:vipto_shop_profile/core/constants/app_colors.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/view_models/shop_profile_view_model.dart';

/// Floating bottom cart bar displaying total selected Kirana items and price in Rupee (₹)
class CartSummaryBarWidget extends StatelessWidget {
  const CartSummaryBarWidget({
    super.key,
    required this.viewModel,
  });

  final ShopProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.totalCartCount == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.primaryDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${viewModel.totalCartCount} ITEMS',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 11, color: Colors.white70),
                ),
                Text(
                  '₹${viewModel.totalCartPrice.toInt()}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Proceeding to Kirana store order (${viewModel.totalCartCount} items - ₹${viewModel.totalCartPrice.toInt()})',
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Row(
                children: [
                  Text(
                    'View Basket',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_rounded, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
