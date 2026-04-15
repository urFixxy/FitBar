import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _favoritesKey = 'favorite_recipes';

  /// Get saved favorite recipe IDs.
  Future<List<String>> getFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  /// Save a recipe ID to favorites.
  Future<void> addFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    if (!favorites.contains(recipeId)) {
      favorites.add(recipeId);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  /// Remove a recipe ID from favorites.
  Future<void> removeFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    favorites.remove(recipeId);
    await prefs.setStringList(_favoritesKey, favorites);
  }

  /// Check if a recipe is favorited.
  Future<bool> isFavorite(String recipeId) async {
    final favorites = await getFavoriteIds();
    return favorites.contains(recipeId);
  }
}
