# Vipto - Sri Ganesh Kirana & Provision Store Profile (Flutter)

A modern, high-performance Flutter mobile screen built for **Vipto** — an application that helps users discover products available in nearby Indian local neighborhood shops ("Kirana stores").

Shop Identity & Core Information

- **Shop Name**: **Sri Ganesh Kirana & Provision Store**
- **Shop Category**: **Grocery, Provisions & Fresh Vegetables**
- **Rating & Reviews**: **4.9 ★ (248 reviews)**
- **Shop Address**: **Shop No. 4, Laxmi Complex, MG Road, Andheri West, Mumbai, Maharashtra 400058** *(0.4 km away)*
- **Contact Number**: **+91 98201 45892**
- **Operating Hours**: **8:00 AM – 9:30 PM**
- **About Shop**: *"A neighborhood kirana store offering daily essentials — rice, wheat flour, moong dal, cooking oil, spices, packaged snacks, fresh milk, and farm vegetables — priced fairly for the local community."*

10-Item Product Catalog (₹ Indian Rupee Pricing)

All products feature dedicated local asset images embedded in `assets/images/` for instant, offline, CORS-free rendering:

1. **Yellow Moong Dal** — **₹150** *(1 kg pack)*
2. **Aashirvaad Whole Wheat Atta** — **₹315** *(5 kg pack)*
3. **Amul Taaza Toned Milk** — **₹70** *(1 Liter pouch)*
4. **Fortune Refined Sunflower Oil** — **₹170** *(1 Liter pouch)*
5. **Tata Vacuum Evaporated Salt** — **₹30** *(1 kg pack)*
6. **Farm Fresh Red Tomatoes** — **₹50** *(1 kg)*
7. **Lay's Classic Potato Chips** — **₹30** *(28.3g pack)*
8. **Cadbury Dairy Milk Chocolate** — **₹50** *(100g bar)*
9. **Nivea Nourishing Body Milk Lotion** — **₹399** *(400 ml bottle)*
10. **Surf Excel Matic Liquid Detergent** — **₹200** *(1 Liter bottle)*

 Color Palette & Design System

- **Primary Green**: `#2E7D32` *(Deep Forest Kirana Green)*
- **Accent Marigold**: `#F9A825` *(Festive Yellow)*
- **Page Background**: `#FAF8F3` *(Soft Warm Cream)*
- **Card Background**: `#FFFFFF`
- **"Open Now" Badge**: `#E6F4EA` / `#1E7B34`
- **Rating Badge**: `#FFF3CD` / `#B8860B`

 Features & UI Highlights

- **Dynamic Sliver Header**: Collapsible `SliverAppBar` with gradient overlays, store avatar badge, verified badge, and favorite toggle.
- **Quick Action Bar**: One-tap Call, Directions, Message/WhatsApp, and Share links.
- **In-Shop Product Discovery**: Filter items by search query or category tabs (*Atta & Flour*, *Spices & Salt*, *Oils & Ghee*, *Dairy*, *Pulses & Dals*, *Vegetables*, *Snacks & Chocolates*, *Personal Care*, *Household & Cleaning*).
- **Interactive Shopping Basket**: Add/remove product counter controls with real-time floating cart summary bar.
- **Customer Reviews Section**: Star distribution breakdown and authentic user feedback cards.

 Architecture & Project Structure

Follows standard Flutter MVVM (Model-View-ViewModel) architectural layered pattern:

```text
lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart         # Kirana color design system
│   └── theme/
│       └── app_theme.dart          # Material 3 & Google Fonts configuration
├── data/
│   ├── models/
│   │   ├── product_model.dart      # Product entity with discount calculations
│   │   ├── review_model.dart       # Customer review entity
│   │   └── shop_model.dart         # Shop profile entity
│   └── repositories/
│       └── shop_repository.dart    # Repository supplying Kirana data & asset paths
├── ui/
│   └── features/
│       └── shop_profile/
│           ├── view_models/
│           │   └── shop_profile_view_model.dart # Presentation state management
│           └── views/
│               ├── shop_profile_screen.dart     # Main Shop Profile Composite Screen
│               └── widgets/
│                   ├── shop_header.dart         # Sliver header with image & status
│                   ├── shop_info_card.dart      # Name, rating, address & contact card
│                   ├── shop_action_bar.dart     # Call, directions, message & share buttons
│                   ├── product_card.dart        # Product grid card with counter & ₹ price
│                   ├── reviews_section.dart     # Ratings breakdown & review list
│                   └── cart_summary_bar.dart    # Floating checkout summary bar
└── main.dart                       # App entrypoint
```
Testing & Quality Assurance

- **Static Analysis**: `flutter analyze` (**0 lints, 0 warnings, 0 errors**)
- **Unit & Widget Tests**: `flutter test` (**6/6 tests passed**)

To run tests locally:
```bash
flutter test
```

 Running the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/kranti-11/vipto-shop-profile.git
   cd vipto-shop-profile
   ```

2. Fetch dependencies:
   ```bash
   flutter pub get
   ```

3. Run on Web (Chrome):
   ```bash
   flutter run -d chrome
   ```

## 🔗 GitHub Repository

Pushed & public on GitHub:
👉 **[https://github.com/kranti-11/vipto-shop-profile](https://github.com/kranti-11/vipto-shop-profile)**
