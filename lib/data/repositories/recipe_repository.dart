import '../models/recipe.dart';
import '../dummy/dummy_recipes.dart';

class RecipeRepository {
  /// Get all recipes.
  List<Recipe> getAllRecipes() {
    return DummyRecipes.all;
  }

  /// Get recipes filtered by meal category.
  List<Recipe> getByCategory(String category) {
    return DummyRecipes.getByCategory(category);
  }

  /// Get popular recipes (high rating).
  List<Recipe> getPopular() {
    return DummyRecipes.getPopular();
  }

  /// Search recipes that can be made with the given ingredients.
  List<Recipe> searchByIngredients(List<String> ingredientIds) {
    return DummyRecipes.searchByIngredients(ingredientIds);
  }

  /// Get a single recipe by ID.
  Recipe? getById(String id) {
    try {
      return DummyRecipes.all.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Search recipes by title query.
  List<Recipe> searchByTitle(String query) {
    if (query.isEmpty) return DummyRecipes.all;
    return DummyRecipes.all
        .where((r) => r.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
