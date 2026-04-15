import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/nutrition.dart';

class NutritionInfoCard extends StatelessWidget {
  final Nutrition nutrition;

  const NutritionInfoCard({super.key, required this.nutrition});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NutritionItem(
            label: 'Calories',
            value: '${nutrition.calories}',
            unit: 'kcal',
            color: AppColors.accent,
          ),
          _NutritionItem(
            label: 'Protein',
            value: '${nutrition.protein}',
            unit: 'g',
            color: AppColors.info,
          ),
          _NutritionItem(
            label: 'Carbs',
            value: '${nutrition.carbs}',
            unit: 'g',
            color: AppColors.warning,
          ),
          _NutritionItem(
            label: 'Fat',
            value: '${nutrition.fat}',
            unit: 'g',
            color: AppColors.error,
          ),
        ],
      ),
    );
  }
}

class _NutritionItem extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _NutritionItem({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              value,
              style: AppTextStyles.labelLarge.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.caption),
        Text(unit, style: AppTextStyles.labelSmall),
      ],
    );
  }
}
