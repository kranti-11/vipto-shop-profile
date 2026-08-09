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

    test('Loads Kirana shop profile details successfully', () async {
      await viewModel.loadShopProfile('kirana_101', delay: false);

      expect(viewModel.isLoading, isFalse);
      expect(viewModel.shop, isNotNull);
      expect(viewModel.shop!.name, contains('Sri Ganesh Kirana'));
      expect(viewModel.shop!.rating, equals(4.9));
    });

    test('Favorite status toggles correctly', () {
      expect(viewModel.isFavorite, isFalse);
      viewModel.toggleFavorite();
      expect(viewModel.isFavorite, isTrue);
      viewModel.toggleFavorite();
      expect(viewModel.isFavorite, isFalse);
    });

    test('Cart additions and total price calculations are accurate', () async {
      await viewModel.loadShopProfile('kirana_101', delay: false);
      final product = viewModel.shop!.featuredProducts.first; // Price: ₹245

      expect(viewModel.totalCartCount, equals(0));
      expect(viewModel.totalCartPrice, equals(0.0));

      viewModel.addToCart(product);
      expect(viewModel.totalCartCount, equals(1));
      expect(viewModel.totalCartPrice, equals(245.0));

      viewModel.addToCart(product);
      expect(viewModel.totalCartCount, equals(2));
      expect(viewModel.totalCartPrice, equals(490.0));

      viewModel.removeFromCart(product);
      expect(viewModel.totalCartCount, equals(1));
      expect(viewModel.totalCartPrice, equals(245.0));
    });

    test('Product search and category filtering works', () async {
      await viewModel.loadShopProfile('kirana_101', delay: false);

      viewModel.setSearchQuery('Atta');
      expect(viewModel.filteredProducts.length, equals(1));
      expect(viewModel.filteredProducts.first.name, contains('Atta'));

      viewModel.setSearchQuery('');
      expect(viewModel.filteredProducts.length, equals(6));
    });
  });

  group('ShopProfileScreen Widget Tests', () {
    testWidgets('Renders Kirana Shop Profile Screen with required information',
        (WidgetTester tester) async {
      final viewModel = ShopProfileViewModel();
      await viewModel.loadShopProfile('kirana_101', delay: false);

      await tester.pumpWidget(
        MaterialApp(
          home: ShopProfileScreen(viewModel: viewModel),
        ),
      );

      await tester.pump();

      // Verify Shop Profile Header exists
      expect(find.byType(CustomScrollView), findsOneWidget);

      // Verify Required Kirana Store Information
      expect(find.text('Sri Ganesh Kirana & Provision Store'), findsOneWidget); // Shop Name
      expect(find.text('Grocery, Provisions & Fresh Vegetables'), findsOneWidget); // Shop Category
      expect(find.text('4.9'), findsOneWidget); // Rating
      expect(find.textContaining('Laxmi Complex, MG Road'), findsOneWidget); // Address
      expect(find.textContaining('A neighborhood kirana store offering daily essentials'), findsOneWidget); // About
      expect(find.text('+91 98201 45892'), findsOneWidget); // Contact Number
    });
  });
}
