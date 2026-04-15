import '../models/ingredient.dart';
import '../dummy/dummy_ingredients.dart';

class IngredientRepository {
  /// Get all available ingredients.
  List<Ingredient> getAllIngredients() {
    return DummyIngredients.all;
  }

  /// Get ingredients filtered by category.
  List<Ingredient> getByCategory(String category) {
    return DummyIngredients.getByCategory(category);
  }

  /// Search ingredients by name query.
  List<Ingredient> search(String query) {
    return DummyIngredients.search(query);
  }

  /// Get all ingredient categories.
  List<String> getCategories() {
    return IngredientCategory.all;
  }
}
