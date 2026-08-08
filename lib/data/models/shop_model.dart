import 'package:vipto_shop_profile/data/models/product_model.dart';
import 'package:vipto_shop_profile/data/models/review_model.dart';

/// Complete Shop Profile Model containing all required UI attributes
class ShopModel {
  final String id;
  final String name;
  final String category;
  final double rating;
  final int totalReviews;
  final String address;
  final String distance;
  final String aboutDescription;
  final String contactNumber;
  final String email;
  final String profileImageUrl;
  final String logoImageUrl;
  final bool isOpen;
  final String openingHours;
  final bool isVerified;
  final List<ProductModel> featuredProducts;
  final List<ReviewModel> reviews;

  const ShopModel({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.totalReviews,
    required this.address,
    required this.distance,
    required this.aboutDescription,
    required this.contactNumber,
    required this.email,
    required this.profileImageUrl,
    required this.logoImageUrl,
    required this.isOpen,
    required this.openingHours,
    this.isVerified = true,
    required this.featuredProducts,
    required this.reviews,
  });
}
