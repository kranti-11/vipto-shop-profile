/// Model representing a product available in the local shop
class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final double? originalPrice;
  final String unit;
  final String imageUrl;
  final double rating;
  final int stockCount;
  final String description;
  final bool isOrganic;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.unit,
    required this.imageUrl,
    required this.rating,
    required this.stockCount,
    required this.description,
    this.isOrganic = false,
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  int get discountPercentage {
    if (!hasDiscount) return 0;
    return (((originalPrice! - price) / originalPrice!) * 100).round();
  }
}
