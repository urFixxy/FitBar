import 'package:flutter/material.dart';
import '../../../data/models/recipe.dart';
import '../../../data/repositories/recipe_repository.dart';

class RecipeProvider extends ChangeNotifier {
  final RecipeRepository _repository = RecipeRepository();

  List<Recipe> _recipes = [];
  List<Recipe> _searchResults = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';
  bool _isLoading = false;

  /// All recipes.
  List<Recipe> get recipes => _recipes;

  /// Search results from ingredient matching.
  List<Recipe> get searchResults => _searchResults;

  /// Current search query.
  String get searchQuery => _searchQuery;

  /// Selected category filter.
  String get selectedCategory => _selectedCategory;

  /// Loading state.
  bool get isLoading => _isLoading;

  /// Load all recipes.
  void loadRecipes() {
    _recipes = _repository.getAllRecipes();
    notifyListeners();
  }

  /// Get popular recipes.
  List<Recipe> get popularRecipes => _repository.getPopular();

  /// Search recipes using selected ingredient IDs.
  void searchByIngredients(List<String> ingredientIds) {
    _isLoading = true;
    notifyListeners();

    _searchResults = _repository.searchByIngredients(ingredientIds);

    _isLoading = false;
    notifyListeners();
  }

  /// Search recipes by title.
  void searchByTitle(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _searchResults = _recipes;
    } else {
      _searchResults = _repository.searchByTitle(query);
    }
    notifyListeners();
  }

  /// Filter by meal category.
  void filterByCategory(String category) {
    _selectedCategory = category;
    if (category == 'All') {
      _searchResults = _recipes;
    } else {
      _searchResults = _repository.getByCategory(category);
    }
    notifyListeners();
  }

  /// Get recipe by ID.
  Recipe? getRecipeById(String id) {
    return _repository.getById(id);
  }

  /// Calculate match percentage for a recipe against selected ingredients.
  double getMatchPercentage(Recipe recipe, List<String> selectedIds) {
    if (recipe.ingredients.isEmpty || selectedIds.isEmpty) return 0;
    final selectedLower = selectedIds.map((e) => e.toLowerCase()).toSet();
    int matchCount = 0;
    for (final ri in recipe.ingredients) {
      if (selectedLower.contains(ri.toLowerCase())) {
        matchCount++;
      }
    }
    return (matchCount / recipe.ingredients.length) * 100;
  }

  /// Get number of matching ingredients for a recipe.
  int getMatchCount(Recipe recipe, List<String> selectedIds) {
    final selectedLower = selectedIds.map((e) => e.toLowerCase()).toSet();
    int count = 0;
    for (final ri in recipe.ingredients) {
      if (selectedLower.contains(ri.toLowerCase())) {
        count++;
      }
    }
    return count;
  }
}
