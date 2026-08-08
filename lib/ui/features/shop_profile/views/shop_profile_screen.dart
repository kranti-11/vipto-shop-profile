import 'package:flutter/material.dart';
import 'package:vipto_shop_profile/core/constants/app_colors.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/view_models/shop_profile_view_model.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/views/widgets/cart_summary_bar.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/views/widgets/product_card.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/views/widgets/reviews_section.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/views/widgets/shop_action_bar.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/views/widgets/shop_header.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/views/widgets/shop_info_card.dart';

/// Main Shop Profile Screen for Vipto
class ShopProfileScreen extends StatefulWidget {
  const ShopProfileScreen({super.key, this.viewModel});

  final ShopProfileViewModel? viewModel;

  @override
  State<ShopProfileScreen> createState() => _ShopProfileScreenState();
}

class _ShopProfileScreenState extends State<ShopProfileScreen> {
  late final ShopProfileViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel ?? ShopProfileViewModel();
    _viewModel.loadShopProfile('shop_101');
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        final shop = _viewModel.shop;

        if (_viewModel.isLoading || shop == null) {
          return const Scaffold(
            backgroundColor: AppColors.background,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.primary),
                  SizedBox(height: 16),
                  Text(
                    'Loading Vipto Local Shop...',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 1. Collapsible Header Banner & Avatar
              ShopHeaderWidget(
                shop: shop,
                viewModel: _viewModel,
              ),

              // 2. Main Content Body
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shop Info Card (Name, Category, Rating, Address, About, Contact)
                    ShopInfoCardWidget(shop: shop),

                    // Quick Action Buttons (Call, Directions, Message, Share)
                    ShopActionBarWidget(shop: shop),

                    const SizedBox(height: 12),

                    // Search & Filter Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text(
                            'Available Products',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '${_viewModel.filteredProducts.length} Items',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Search Bar inside Shop
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        onChanged: (val) => _viewModel.setSearchQuery(val),
                        decoration: InputDecoration(
                          hintText: 'Search items in ${shop.name}...',
                          hintStyle: const TextStyle(fontSize: 13, color: AppColors.textMuted),
                          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.primary),
                          filled: true,
                          fillColor: AppColors.surface,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: AppColors.border),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: AppColors.border),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Category Pill Selector
                    SizedBox(
                      height: 38,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: _viewModel.categories.length,
                        itemBuilder: (context, index) {
                          final category = _viewModel.categories[index];
                          final isSelected = _viewModel.selectedCategoryIndex == index;

                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ChoiceChip(
                              label: Text(category),
                              selected: isSelected,
                              onSelected: (_) => _viewModel.selectCategory(index),
                              selectedColor: AppColors.primaryDark,
                              backgroundColor: AppColors.surface,
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                color: isSelected ? Colors.white : AppColors.textSecondary,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: isSelected ? AppColors.primaryDark : AppColors.border,
                                ),
                              ),
                              showCheckmark: false,
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              // 3. Products Grid Section
              if (_viewModel.filteredProducts.isEmpty)
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    alignment: Alignment.center,
                    child: const Column(
                      children: [
                        Icon(Icons.search_off_rounded, size: 48, color: AppColors.textMuted),
                        SizedBox(height: 12),
                        Text(
                          'No products found matching your search',
                          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = _viewModel.filteredProducts[index];
                        return ProductCardWidget(
                          product: product,
                          viewModel: _viewModel,
                        );
                      },
                      childCount: _viewModel.filteredProducts.length,
                    ),
                  ),
                ),

              // 4. Reviews & Rating Summary
              SliverToBoxAdapter(
                child: ReviewsSectionWidget(
                  reviews: shop.reviews,
                  rating: shop.rating,
                  totalReviews: shop.totalReviews,
                ),
              ),

              // Bottom Padding to clear floating cart bar
              const SliverToBoxAdapter(
                child: SizedBox(height: 80),
              ),
            ],
          ),
          bottomSheet: CartSummaryBarWidget(viewModel: _viewModel),
        );
      },
    );
  }
}
