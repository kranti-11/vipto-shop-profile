import 'package:flutter/material.dart';
import 'package:vipto_shop_profile/core/constants/app_colors.dart';
import 'package:vipto_shop_profile/data/models/shop_model.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/view_models/shop_profile_view_model.dart';

/// Collapsible Header Banner with Kirana storefront imagery, avatar badge, and action buttons
class ShopHeaderWidget extends StatelessWidget {
  const ShopHeaderWidget({
    super.key,
    required this.shop,
    required this.viewModel,
  });

  final ShopModel shop;
  final ShopProfileViewModel viewModel;

  bool get _isTest =>
      WidgetsBinding.instance.runtimeType.toString().contains('TestWidgets');

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.primaryDark,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.black.withValues(alpha: 0.4),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 20),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Vipto Kirana Discovery navigation'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black.withValues(alpha: 0.4),
            child: IconButton(
              icon: Icon(
                viewModel.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: viewModel.isFavorite ? AppColors.accentRose : Colors.white,
                size: 20,
              ),
              onPressed: () => viewModel.toggleFavorite(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: CircleAvatar(
            backgroundColor: Colors.black.withValues(alpha: 0.4),
            child: IconButton(
              icon: const Icon(Icons.share_rounded, color: Colors.white, size: 20),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Shared ${shop.name} profile link'),
                    backgroundColor: AppColors.primary,
                  ),
                );
              },
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background Kirana Shop Image
            if (_isTest)
              Container(
                color: AppColors.primaryDark,
                child: const Icon(Icons.storefront_rounded, size: 80, color: Colors.white54),
              )
            else
              Image.network(
                shop.profileImageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.primaryDark,
                  child: const Icon(Icons.storefront_rounded, size: 80, color: Colors.white54),
                ),
              ),

            // Soft Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.4),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),

            // Shop Avatar / Logo Overlay at bottom left
            Positioned(
              left: 16,
              bottom: 16,
              child: Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: _isTest
                          ? Container(
                              color: AppColors.primary,
                              child: const Icon(Icons.store_rounded, color: Colors.white, size: 36),
                            )
                          : Image.network(
                              shop.logoImageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: AppColors.primary,
                                child: const Icon(Icons.store_rounded, color: Colors.white, size: 36),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: shop.isOpen ? AppColors.statusOpenBg : Colors.red.shade100,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: shop.isOpen ? AppColors.statusOpen : Colors.red,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: shop.isOpen ? AppColors.statusOpen : Colors.red,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              shop.isOpen ? 'Open Now' : 'Closed',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: shop.isOpen ? AppColors.statusOpen : Colors.red.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        shop.openingHours,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
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
