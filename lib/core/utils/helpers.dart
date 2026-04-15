import 'package:flutter/material.dart';

class Helpers {
  Helpers._();

  /// Format cooking duration in minutes to a human-readable string.
  static String formatDuration(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final remaining = minutes % 60;
    if (remaining == 0) {
      return '$hours hr';
    }
    return '$hours hr $remaining min';
  }

  /// Format calorie count with "kcal" suffix.
  static String formatCalories(int kcal) {
    return '$kcal kcal';
  }

  /// Capitalize the first letter of a string.
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Calculate match percentage between selected ingredients and recipe ingredients.
  static double ingredientMatchPercentage({
    required List<String> selected,
    required List<String> recipeIngredients,
  }) {
    if (recipeIngredients.isEmpty) return 0;
    final selectedLower = selected.map((e) => e.toLowerCase()).toSet();
    int matchCount = 0;
    for (final ingredient in recipeIngredients) {
      if (selectedLower.any((s) => ingredient.toLowerCase().contains(s))) {
        matchCount++;
      }
    }
    return (matchCount / recipeIngredients.length) * 100;
  }

  /// Get greeting based on time of day.
  static String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  /// Get icon based on time of day.
  static IconData getIconGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return Icons.wb_sunny_outlined;
    if (hour < 17) return Icons.cloud;
    return Icons.nights_stay_outlined;
  }
}