class Ingredient {
  final String id;
  final String name;
  final String category;
  final String icon;

  const Ingredient({
    required this.id,
    required this.name,
    required this.category,
    this.icon = '🥘',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ingredient &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Ingredient(id: $id, name: $name)';
}

/// Categories for organizing ingredients.
class IngredientCategory {
  static const String protein = 'Protein';
  static const String vegetables = 'Vegetables';
  static const String fruits = 'Fruits';
  static const String dairy = 'Dairy';
  static const String grains = 'Grains';
  static const String spices = 'Spices';
  static const String sauces = 'Sauces';
  static const String others = 'Others';

  static List<String> get all => [
        protein,
        vegetables,
        fruits,
        dairy,
        grains,
        spices,
        sauces,
        others,
      ];
}
