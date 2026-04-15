import 'package:flutter/material.dart';
import 'features/home/screens/home_screen.dart';
import 'features/ingredients/screens/ingredient_input_screen.dart';
import 'features/favorites/screens/favorites_screen.dart';
import 'features/profile/screens/profile_screen.dart';
import 'shared/widgets/custom_bottom_nav.dart';

/// Main app shell with bottom navigation.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    IngredientInputScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
