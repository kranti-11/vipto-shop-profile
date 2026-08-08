import 'package:flutter/material.dart';
import 'package:vipto_shop_profile/data/models/product_model.dart';
import 'package:vipto_shop_profile/data/models/shop_model.dart';
import 'package:vipto_shop_profile/data/repositories/shop_repository.dart';

/// ViewModel managing state and user actions for Shop Profile Screen
class ShopProfileViewModel extends ChangeNotifier {
  ShopProfileViewModel({ShopRepository? repository})
      : _repository = repository ?? ShopRepository();

  final ShopRepository _repository;

  ShopModel? _shop;
  ShopModel? get shop => _shop;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  final Map<String, int> _cartQuantities = {};
  Map<String, int> get cartQuantities => Map.unmodifiable(_cartQuantities);

  final List<String> categories = ['All Products', 'Bakery', 'Dairy', 'Produce', 'Beverages'];

  Future<void> loadShopProfile(String shopId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _shop = await _repository.fetchShopDetails(shopId);
    } catch (_) {
      // Gracefully handle any error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase().trim();
    notifyListeners();
  }

  void addToCart(ProductModel product) {
    final current = _cartQuantities[product.id] ?? 0;
    _cartQuantities[product.id] = current + 1;
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    final current = _cartQuantities[product.id] ?? 0;
    if (current > 1) {
      _cartQuantities[product.id] = current - 1;
    } else {
      _cartQuantities.remove(product.id);
    }
    notifyListeners();
  }

  int get totalCartCount {
    return _cartQuantities.values.fold(0, (sum, qty) => sum + qty);
  }

  double get totalCartPrice {
    if (_shop == null) return 0.0;
    double total = 0.0;
    _cartQuantities.forEach((prodId, qty) {
      final product = _shop!.featuredProducts.firstWhere(
        (p) => p.id == prodId,
        orElse: () => _shop!.featuredProducts.first,
      );
      total += product.price * qty;
    });
    return total;
  }

  List<ProductModel> get filteredProducts {
    if (_shop == null) return [];
    var list = _shop!.featuredProducts;

    if (_selectedCategoryIndex > 0) {
      final targetCat = categories[_selectedCategoryIndex].toLowerCase();
      list = list.where((p) => p.category.toLowerCase() == targetCat).toList();
    }

    if (_searchQuery.isNotEmpty) {
      list = list
          .where((p) =>
              p.name.toLowerCase().contains(_searchQuery) ||
              p.category.toLowerCase().contains(_searchQuery))
          .toList();
    }

    return list;
  }
}
