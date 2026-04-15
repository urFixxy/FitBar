import 'package:flutter/material.dart';
import '../../../data/models/ingredient.dart';
import '../../../data/repositories/ingredient_repository.dart';

class IngredientProvider extends ChangeNotifier {
  final IngredientRepository _repository = IngredientRepository();

  List<Ingredient> _allIngredients = [];
  List<Ingredient> _filteredIngredients = [];
  final List<Ingredient> _selectedIngredients = [];
  String _searchQuery = '';
  String _selectedCategory = 'All';

  /// All available ingredients.
  List<Ingredient> get allIngredients => _allIngredients;

  /// Filtered ingredients based on search and category.
  List<Ingredient> get filteredIngredients => _filteredIngredients;

  /// Currently selected ingredients by the user.
  List<Ingredient> get selectedIngredients =>
      List.unmodifiable(_selectedIngredients);

  /// Current search query.
  String get searchQuery => _searchQuery;

  /// Current selected category filter.
  String get selectedCategory => _selectedCategory;

  /// Number of selected ingredients.
  int get selectedCount => _selectedIngredients.length;

  /// Whether any ingredients are selected.
  bool get hasSelection => _selectedIngredients.isNotEmpty;

  /// Initialize data.
  void loadIngredients() {
    _allIngredients = _repository.getAllIngredients();
    _filteredIngredients = _allIngredients;
    notifyListeners();
  }

  /// Toggle selection of an ingredient.
  void toggleIngredient(Ingredient ingredient) {
    if (_selectedIngredients.contains(ingredient)) {
      _selectedIngredients.remove(ingredient);
    } else {
      _selectedIngredients.add(ingredient);
    }
    notifyListeners();
  }

  /// Check if an ingredient is selected.
  bool isSelected(Ingredient ingredient) {
    return _selectedIngredients.contains(ingredient);
  }

  /// Remove a specific ingredient from selection.
  void removeIngredient(Ingredient ingredient) {
    _selectedIngredients.remove(ingredient);
    notifyListeners();
  }

  /// Clear all selected ingredients.
  void clearSelection() {
    _selectedIngredients.clear();
    notifyListeners();
  }

  /// Update search query and filter results.
  void updateSearch(String query) {
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  /// Set category filter.
  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
    notifyListeners();
  }

  /// Get selected ingredient IDs for recipe search.
  List<String> get selectedIngredientIds =>
      _selectedIngredients.map((i) => i.id).toList();

  void _applyFilters() {
    List<Ingredient> result = _allIngredients;

    // Apply category filter
    if (_selectedCategory != 'All') {
      result = result.where((i) => i.category == _selectedCategory).toList();
    }

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      result = result
          .where(
              (i) => i.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    _filteredIngredients = result;
  }
}
