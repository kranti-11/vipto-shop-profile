Vipto - Shop Profile Screen (Flutter)

A modern, high-performance Flutter mobile screen built for **Vipto** — an application that helps users discover products available in nearby local shops.

---
 Features & UI Highlights

This project implements a complete, interactive **Shop Profile Screen** designed with Material 3, custom typography, dynamic sliver header, and clean MVVM architecture:

Shop Profile Header & Banner**: Collapsible `SliverAppBar` with gradient overlays, shop avatar badge, verified badge, and favorite toggle.
Shop Core Details**:
  * **Shop Name**: *GreenValley Organic & Bakery*
  * **Shop Category**: *Artisanal Bakery & Fresh Grocery*
  * **Rating & Reviews**: *4.8 ★ (184 reviews)*
  * **Shop Address**: *742 Evergreen Terrace, Sector 4, Metro City (0.6 km away)*
  * **About Shop**: Detailed short description highlighting local organic produce & sourdough items.
  * **Contact Number**: *+1 (555) 389-2041* with direct call trigger.
   **Quick Action Bar**: One-tap Call, Directions (Map Route), Message/WhatsApp, and Share links.
  **In-Shop Product Discovery**: Filter products by search query or category tabs (*Bakery*, *Dairy*, *Produce*, *Beverages*).
  **Interactive Shopping Basket**: Add/remove product counter controls with floating real-time cart summary bar.
  **Customer Reviews Section**: Breakdown summary with rating bars and user feedback cards.

 Architecture & Project Structure

Follows standard Flutter MVVM (Model-View-ViewModel) architectural layered pattern:

```text
lib/
├── core/
│   ├── constants/
│   │   └── app_colors.dart         # Color design system
│   └── theme/
│       └── app_theme.dart          # Material 3 & Google Fonts configuration
├── data/
│   ├── models/
│   │   ├── product_model.dart      # Local product entity
│   │   ├── review_model.dart       # Customer review entity
│   │   └── shop_model.dart         # Shop profile entity
│   └── repositories/
│       └── shop_repository.dart    # Mock shop repository with realistic local data
├── ui/
│   └── features/
│       └── shop_profile/
│           ├── view_models/
│           │   └── shop_profile_view_model.dart # State management & business logic
│           └── views/
│               ├── shop_profile_screen.dart     # Main Shop Profile Screen
│               └── widgets/
│                   ├── shop_header.dart         # Sliver header with image & status
│                   ├── shop_info_card.dart      # Name, rating, address & contact card
│                   ├── shop_action_bar.dart     # Call, directions, message & share buttons
│                   ├── product_card.dart        # Product grid card with counter
│                   ├── reviews_section.dart     # Ratings breakdown & review list
│                   └── cart_summary_bar.dart    # Floating checkout bar
└── main.dart                       # App entrypoint
```

 Testing & Quality Assurance

Static analysis and unit/widget test suites:

- **Static Analysis**: `flutter analyze` (Zero lints, zero warnings)
- **Unit & Widget Tests**: `flutter test` (100% passing)

To run tests locally:
```bash
flutter test
```
Running the Project

1. Clone or navigate to the repository directory:
   ```bash
   cd vipto-shop-profile
   ```

2. Fetch dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app on your connected device, simulator, or web browser:
   ```bash
   flutter run
   ```

 GitHub Repository Setup

To push to your public GitHub repository (`vipto-shop-profile`):

```bash
git init
git add .
git commit -m "feat: complete Vipto Shop Profile Screen with MVVM architecture"
git branch -M main
git remote add origin https://github.com/<YOUR_GITHUB_USERNAME>/vipto-shop-profile.git
git push -u origin main
```
