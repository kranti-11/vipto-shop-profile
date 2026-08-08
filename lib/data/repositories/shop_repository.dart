import 'package:vipto_shop_profile/data/models/product_model.dart';
import 'package:vipto_shop_profile/data/models/review_model.dart';
import 'package:vipto_shop_profile/data/models/shop_model.dart';

/// Repository supplying local shop profile data
class ShopRepository {
  Future<ShopModel> fetchShopDetails(String shopId, {bool delay = true}) async {
    if (delay) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return const ShopModel(
      id: 'shop_101',
      name: 'GreenValley Organic & Bakery',
      category: 'Artisanal Bakery & Fresh Grocery',
      rating: 4.8,
      totalReviews: 184,
      address: '742 Evergreen Terrace, Sector 4, Metro City',
      distance: '0.6 km away',
      aboutDescription:
          'GreenValley is your premier neighborhood shop offering daily farm-fresh organic produce, handmade sourdough bread, cold-pressed juices, and artisanal dairy products sourced directly from local farmers.',
      contactNumber: '+1 (555) 389-2041',
      email: 'hello@greenvalleyorganic.com',
      profileImageUrl:
          'https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=1200&q=80',
      logoImageUrl:
          'https://images.unsplash.com/photo-1534723452862-4c874018d66d?auto=format&fit=crop&w=300&q=80',
      isOpen: true,
      openingHours: '08:00 AM - 09:30 PM',
      isVerified: true,
      featuredProducts: [
        ProductModel(
          id: 'prod_1',
          name: 'Handcrafted Sourdough Bread',
          category: 'Bakery',
          price: 4.99,
          originalPrice: 6.49,
          unit: '500g loaf',
          imageUrl:
              'https://images.unsplash.com/photo-1589367920969-ab8e050bbb04?auto=format&fit=crop&w=600&q=80',
          rating: 4.9,
          stockCount: 12,
          description: 'Freshly baked every morning with 24h natural fermentation.',
          isOrganic: true,
        ),
        ProductModel(
          id: 'prod_2',
          name: 'Farm Fresh Organic Milk',
          category: 'Dairy',
          price: 3.49,
          unit: '1 Liter',
          imageUrl:
              'https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=600&q=80',
          rating: 4.8,
          stockCount: 25,
          description: 'Pasteurized whole milk from grass-fed local dairy cows.',
          isOrganic: true,
        ),
        ProductModel(
          id: 'prod_3',
          name: 'Avocado Hass (Pack of 3)',
          category: 'Produce',
          price: 3.99,
          originalPrice: 4.99,
          unit: '3 pcs',
          imageUrl:
              'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&w=600&q=80',
          rating: 4.7,
          stockCount: 18,
          description: 'RIPE & ready to eat Hass avocados from local orchards.',
          isOrganic: true,
        ),
        ProductModel(
          id: 'prod_4',
          name: 'Cold Pressed Orange Juice',
          category: 'Beverages',
          price: 4.25,
          unit: '500 ml',
          imageUrl:
              'https://images.unsplash.com/photo-1613478223719-2ab802602423?auto=format&fit=crop&w=600&q=80',
          rating: 4.9,
          stockCount: 8,
          description: '100% pure squeezed oranges with no added sugar or water.',
          isOrganic: true,
        ),
        ProductModel(
          id: 'prod_5',
          name: 'Wildflower Honey Jar',
          category: 'Pantry',
          price: 8.99,
          originalPrice: 10.50,
          unit: '350g jar',
          imageUrl:
              'https://images.unsplash.com/photo-1587049352847-4a222e784d38?auto=format&fit=crop&w=600&q=80',
          rating: 5.0,
          stockCount: 15,
          description: 'Unfiltered raw honey harvested from nearby wild apiaries.',
          isOrganic: true,
        ),
      ],
      reviews: [
        ReviewModel(
          id: 'rev_1',
          userName: 'Sarah Jenkins',
          userAvatar:
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80',
          rating: 5.0,
          date: '2 days ago',
          comment:
              'Best sourdough in town! The staff is super friendly and Vipto live stock availability made pickup seamless.',
        ),
        ReviewModel(
          id: 'rev_2',
          userName: 'David Miller',
          userAvatar:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
          rating: 4.8,
          date: '1 week ago',
          comment:
              'Great selection of fresh organic veggies right in our local market. Highly recommended!',
        ),
      ],
    );
  }
}
