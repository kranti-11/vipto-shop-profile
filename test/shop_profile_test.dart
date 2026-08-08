import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/view_models/shop_profile_view_model.dart';
import 'package:vipto_shop_profile/ui/features/shop_profile/views/shop_profile_screen.dart';

void main() {
  group('ShopProfileViewModel Unit Tests', () {
    late ShopProfileViewModel viewModel;

    setUp(() {
      viewModel = ShopProfileViewModel();
    });

    test('Initial state should be loading', () {
      expect(viewModel.isLoading, isTrue);
      expect(viewModel.shop, isNull);
      expect(viewModel.isFavorite, isFalse);
    });

    test('Loads shop profile details successfully', () async {
      await viewModel.loadShopProfile('shop_101');

      expect(viewModel.isLoading, isFalse);
      expect(viewModel.shop, isNotNull);
      expect(viewModel.shop!.name, contains('GreenValley'));
      expect(viewModel.shop!.rating, equals(4.8));
    });

    test('Favorite status toggles correctly', () {
      expect(viewModel.isFavorite, isFalse);
      viewModel.toggleFavorite();
      expect(viewModel.isFavorite, isTrue);
      viewModel.toggleFavorite();
      expect(viewModel.isFavorite, isFalse);
    });

    test('Cart additions and total price calculations are accurate', () async {
      await viewModel.loadShopProfile('shop_101');
      final product = viewModel.shop!.featuredProducts.first; // Price: 4.99

      expect(viewModel.totalCartCount, equals(0));
      expect(viewModel.totalCartPrice, equals(0.0));

      viewModel.addToCart(product);
      expect(viewModel.totalCartCount, equals(1));
      expect(viewModel.totalCartPrice, equals(4.99));

      viewModel.addToCart(product);
      expect(viewModel.totalCartCount, equals(2));
      expect(viewModel.totalCartPrice, equals(9.98));

      viewModel.removeFromCart(product);
      expect(viewModel.totalCartCount, equals(1));
      expect(viewModel.totalCartPrice, equals(4.99));
    });

    test('Product search and category filtering works', () async {
      await viewModel.loadShopProfile('shop_101');

      viewModel.setSearchQuery('Sourdough');
      expect(viewModel.filteredProducts.length, equals(1));
      expect(viewModel.filteredProducts.first.name, contains('Sourdough'));

      viewModel.setSearchQuery('');
      expect(viewModel.filteredProducts.length, equals(5));
    });
  });

  group('ShopProfileScreen Widget Tests', () {
    testWidgets('Renders Shop Profile Screen with required information',
        (WidgetTester tester) async {
      final viewModel = ShopProfileViewModel();
      await viewModel.loadShopProfile('shop_101');

      await tester.pumpWidget(
        MaterialApp(
          home: ShopProfileScreen(viewModel: viewModel),
        ),
      );

      await tester.pumpAndSettle();

      // Verify Shop Profile Image / Banner & Header exists
      expect(find.byType(CustomScrollView), findsOneWidget);

      // Verify Required Fields
      expect(find.text('GreenValley Organic & Bakery'), findsOneWidget); // Shop Name
      expect(find.text('Artisanal Bakery & Fresh Grocery'), findsOneWidget); // Shop Category
      expect(find.text('4.8'), findsOneWidget); // Rating
      expect(find.textContaining('742 Evergreen Terrace'), findsOneWidget); // Shop Address
      expect(find.textContaining('GreenValley is your premier neighborhood shop'), findsOneWidget); // About Shop
      expect(find.text('+1 (555) 389-2041'), findsOneWidget); // Contact Number
    });
  });
}
