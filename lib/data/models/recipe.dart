import 'nutrition.dart';

class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int cookingTime; // in minutes
  final int servings;
  final String difficulty; // Easy, Medium, Hard
  final String category; // Breakfast, Lunch, Dinner, Snack, Dessert
  final Nutrition nutrition;
  final double rating;

  const Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.cookingTime,
    required this.servings,
    required this.difficulty,
    required this.category,
    required this.nutrition,
    this.rating = 0.0,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recipe && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Recipe(id: $id, title: $title)';
}

/// Recipe difficulty levels.
class RecipeDifficulty {
  static const String easy = 'Easy';
  static const String medium = 'Medium';
  static const String hard = 'Hard';
}

/// Recipe meal categories.
class RecipeCategory {
  static const String breakfast = 'Breakfast';
  static const String lunch = 'Lunch';
  static const String dinner = 'Dinner';
  static const String snack = 'Snack';
  static const String dessert = 'Dessert';

  static List<String> get all => [
        breakfast,
        lunch,
        dinner,
        snack,
        dessert,
      ];
}
