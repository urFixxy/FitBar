class Nutrition {
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final double fiber;

  const Nutrition({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.fiber = 0,
  });

  @override
  String toString() =>
      'Nutrition(cal: $calories, protein: ${protein}g, carbs: ${carbs}g, fat: ${fat}g)';
}
