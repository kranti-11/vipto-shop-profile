import 'package:vipto_shop_profile/data/models/product_model.dart';
import 'package:vipto_shop_profile/data/models/review_model.dart';
import 'package:vipto_shop_profile/data/models/shop_model.dart';

/// Repository supplying authentic Indian Kirana Store details and products
class ShopRepository {
  Future<ShopModel> fetchShopDetails(String shopId, {bool delay = true}) async {
    if (delay) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return const ShopModel(
      id: 'kirana_101',
      name: 'Sri Ganesh Kirana & Provision Store',
      category: 'Grocery, Provisions & Fresh Vegetables',
      rating: 4.9,
      totalReviews: 248,
      address: 'Shop No. 4, Laxmi Complex, MG Road, Andheri West, Mumbai, Maharashtra 400058',
      distance: '0.4 km away',
      aboutDescription:
          'A neighborhood kirana store offering daily essentials — rice, atta, pulses, cooking oil, spices, packaged snacks, dairy, and fresh vegetables — sourced locally and priced fairly for the whole community.',
      contactNumber: '+91 98201 45892',
      email: 'contact@sriganeshkirana.in',
      profileImageUrl:
          'https://images.unsplash.com/photo-1604719312566-8912e9227c6a?auto=format&fit=crop&w=1200&q=80',
      logoImageUrl:
          'https://images.unsplash.com/photo-1578916171728-46686eac8d58?auto=format&fit=crop&w=400&q=80',
      isOpen: true,
      openingHours: '8:00 AM – 9:30 PM',
      isVerified: true,
      featuredProducts: [
        ProductModel(
          id: 'item_1',
          name: 'Aashirvaad Whole Wheat Atta',
          category: 'Atta & Flour',
          price: 245.0,
          originalPrice: 270.0,
          unit: '5 kg pack',
          imageUrl:
              'https://images.unsplash.com/photo-1574323347407-f5e1ad6d020b?auto=format&fit=crop&w=600&q=80',
          rating: 4.9,
          stockCount: 25,
          description: '100% pure whole wheat flour with 0% maida for soft rotis.',
          isOrganic: true,
        ),
        ProductModel(
          id: 'item_2',
          name: 'Tata Vacuum Evaporated Salt',
          category: 'Spices & Salt',
          price: 28.0,
          unit: '1 kg pack',
          imageUrl:
              'https://images.unsplash.com/photo-1518110168401-f2877ee2c085?auto=format&fit=crop&w=600&q=80',
          rating: 4.9,
          stockCount: 50,
          description: 'Iodized salt ensuring health and purity in every meal.',
          isOrganic: false,
        ),
        ProductModel(
          id: 'item_3',
          name: 'Fortune Refined Sunflower Oil',
          category: 'Oils & Ghee',
          price: 165.0,
          originalPrice: 180.0,
          unit: '1 Liter pouch',
          imageUrl:
              'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=600&q=80',
          rating: 4.8,
          stockCount: 30,
          description: 'Light and healthy cooking oil enriched with Vitamins A & D.',
          isOrganic: false,
        ),
        ProductModel(
          id: 'item_4',
          name: 'Amul Taaza Toned Milk',
          category: 'Dairy',
          price: 28.0,
          unit: '500 ml pouch',
          imageUrl:
              'https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=600&q=80',
          rating: 5.0,
          stockCount: 40,
          description: 'Fresh pasteurized toned milk delivered daily every morning.',
          isOrganic: true,
        ),
        ProductModel(
          id: 'item_5',
          name: 'Unpolished Toor Dal (Arhar)',
          category: 'Pulses & Dals',
          price: 140.0,
          originalPrice: 155.0,
          unit: '1 kg pack',
          imageUrl:
              'https://images.unsplash.com/photo-1585994191611-72ec0153e40a?auto=format&fit=crop&w=600&q=80',
          rating: 4.8,
          stockCount: 20,
          description: 'High-protein unpolished yellow lentils for home-cooked dal.',
          isOrganic: true,
        ),
        ProductModel(
          id: 'item_6',
          name: 'Farm Fresh Red Tomatoes',
          category: 'Vegetables',
          price: 35.0,
          unit: '1 kg',
          imageUrl:
              'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80',
          rating: 4.7,
          stockCount: 15,
          description: 'Freshly harvested ripe red tomatoes from nearby local farms.',
          isOrganic: true,
        ),
      ],
      reviews: [
        ReviewModel(
          id: 'rev_101',
          userName: 'Rajesh Sharma',
          userAvatar:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
          rating: 5.0,
          date: 'Yesterday',
          comment:
              'Best neighborhood kirana store! Uncle always gives fresh veggies and fair MRP prices. Fast doorstep delivery via Vipto.',
        ),
        ReviewModel(
          id: 'rev_102',
          userName: 'Priya Patel',
          userAvatar:
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80',
          rating: 4.9,
          date: '3 days ago',
          comment:
              'Very dependable for daily milk, atta, and cooking oil. Stock is always fresh and authentic.',
        ),
      ],
    );
  }
}
