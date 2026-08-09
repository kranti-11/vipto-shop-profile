import 'package:flutter/material.dart';
import 'package:vipto_shop_profile/core/constants/app_colors.dart';
import 'package:vipto_shop_profile/data/models/shop_model.dart';

/// Card component presenting authentic Indian Kirana Shop Profile details
class ShopInfoCardWidget extends StatelessWidget {
  const ShopInfoCardWidget({
    super.key,
    required this.shop,
  });

  final ShopModel shop;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shop Name & Verified Local Badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    shop.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                if (shop.isVerified)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.verified_rounded, size: 14, color: AppColors.primary),
                        SizedBox(width: 4),
                        Text(
                          'Verified Kirana',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),

            // Shop Category Line
            Row(
              children: [
                const Icon(Icons.storefront_rounded, size: 16, color: AppColors.primary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    shop.category,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Rating & Distance Row with marigold/yellow rating badge (#FFF3CD / #B8860B)
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.ratingBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded, size: 16, color: AppColors.ratingText),
                      const SizedBox(width: 4),
                      Text(
                        '${shop.rating}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.ratingText,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${shop.totalReviews} reviews)',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.ratingText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.near_me_rounded, size: 14, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text(
                        shop.distance,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.divider, height: 1),
            const SizedBox(height: 16),

            // Shop Address in Indian Format
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_outlined, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    shop.address,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Contact Number in Indian format (+91 98XXX XXXXX)
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Calling ${shop.name}: ${shop.contactNumber}'),
                    backgroundColor: AppColors.primary,
                  ),
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.phone_outlined, size: 18, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text(
                      shop.contactNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Call Store',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // About Shop (Description)
            const Text(
              'About Shop',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              shop.aboutDescription,
              style: const TextStyle(
                fontSize: 13,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
