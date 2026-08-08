import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'ui/features/shop_profile/views/shop_profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ViptoApp());
}

class ViptoApp extends StatelessWidget {
  const ViptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vipto - Local Shop Profile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const ShopProfileScreen(),
    );
  }
}
