import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary — Elegant Maroon
  static const Color primary = Color(0xFF7B2D3B);
  static const Color primaryLight = Color(0xFFAC5664);
  static const Color primaryDark = Color(0xFF4D0A16);
  static const Color primarySurface = Color(0xFFF9E8E8);

  // Accent — Soft Sand Gold
  static const Color accent = Color(0xFFD4A574);
  static const Color accentLight = Color(0xFFE6C4A3);
  static const Color accentSurface = Color(0xFFFAF3EB);

  // Neutrals — Warm Cream Palette
  static const Color background = Color(0xFFFDF8F4);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5EEE8);
  static const Color border = Color(0xFFE8DED3);
  static const Color divider = Color(0xFFDDD0C2);

  // Text — Dark Earth/Charcoal
  static const Color textPrimary = Color(0xFF2C2523);
  static const Color textSecondary = Color(0xFF6B5E5B);
  static const Color textHint = Color(0xFFAFA29E);
  static const Color textOnPrimary = Color(0xFFFFF9F5);

  // Semantic
  static const Color success = Color(0xFF5E8C61);
  static const Color warning = Color(0xFFD4A24E);
  static const Color error = Color(0xFF9E3F3F);
  static const Color info = Color(0xFF5B7A9E);

  // Recipe category colors — Muted Earthy Tones
  static const Color breakfast = Color(0xFFD4A24E);
  static const Color lunch = Color(0xFF8C7A5E);
  static const Color dinner = Color(0xFF7B2D3B);
  static const Color snack = Color(0xFFB5937E);
  static const Color dessert = Color(0xFF937EB5);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, accentLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF4D0A16), Color(0xFF7B2D3B), Color(0xFFAC5664)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [Color(0xFFD4A574), Color(0xFFE6C4A3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
