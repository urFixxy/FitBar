import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

extension ContextExtensions on BuildContext {
  /// Shortcut to access ThemeData.
  ThemeData get theme => Theme.of(this);

  /// Shortcut to access ColorScheme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Shortcut to access TextTheme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Shortcut to access MediaQuery size.
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Screen width.
  double get screenWidth => screenSize.width;

  /// Screen height.
  double get screenHeight => screenSize.height;

  /// Show a snackbar with a message.
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? AppColors.error
            : AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
