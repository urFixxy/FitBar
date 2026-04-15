import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/ingredients/providers/ingredient_provider.dart';
import 'features/recipes/providers/recipe_provider.dart';
import 'features/favorites/providers/favorites_provider.dart';
import 'features/splash/screens/splash_screen.dart';

void main() {
  runApp(const FitServeApp());
}

class FitServeApp extends StatelessWidget {
  const FitServeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IngredientProvider()),
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'FitServe',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
