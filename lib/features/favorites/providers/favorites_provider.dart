import 'package:flutter/material.dart';
import '../../../data/models/recipe.dart';
import '../../../data/services/local_storage_service.dart';
import '../../../data/repositories/recipe_repository.dart';

class FavoritesProvider extends ChangeNotifier {
  final LocalStorageService _storageService = LocalStorageService();
  final RecipeRepository _recipeRepository = RecipeRepository();

  List<String> _favoriteIds = [];
  List<Recipe> _favoriteRecipes = [];
  bool _isLoading = false;

  /// List of favorite recipe IDs.
  List<String> get favoriteIds => _favoriteIds;

  /// Full favorite Recipe objects.
  List<Recipe> get favoriteRecipes => _favoriteRecipes;

  /// Loading state.
  bool get isLoading => _isLoading;

  /// Number of favorites.
  int get count => _favoriteIds.length;

  /// Load favorites from local storage.
  Future<void> loadFavorites() async {
    _isLoading = true;
    notifyListeners();

    _favoriteIds = await _storageService.getFavoriteIds();
    _favoriteRecipes = _favoriteIds
        .map((id) => _recipeRepository.getById(id))
        .whereType<Recipe>()
        .toList();

    _isLoading = false;
    notifyListeners();
  }

  /// Toggle favorite status for a recipe.
  Future<void> toggleFavorite(String recipeId) async {
    if (_favoriteIds.contains(recipeId)) {
      await _storageService.removeFavorite(recipeId);
      _favoriteIds.remove(recipeId);
      _favoriteRecipes.removeWhere((r) => r.id == recipeId);
    } else {
      await _storageService.addFavorite(recipeId);
      _favoriteIds.add(recipeId);
      final recipe = _recipeRepository.getById(recipeId);
      if (recipe != null) {
        _favoriteRecipes.add(recipe);
      }
    }
    notifyListeners();
  }

  /// Check if a recipe is a favorite.
  bool isFavorite(String recipeId) {
    return _favoriteIds.contains(recipeId);
  }
}
