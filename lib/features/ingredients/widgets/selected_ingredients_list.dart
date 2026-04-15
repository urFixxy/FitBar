import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../providers/ingredient_provider.dart';

class SelectedIngredientsList extends StatelessWidget {
  const SelectedIngredientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IngredientProvider>(
      builder: (context, provider, _) {
        if (!provider.hasSelection) return const SizedBox.shrink();
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md,
            vertical: AppSizes.sm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selected (${provider.selectedCount})',
                    style: AppTextStyles.labelLarge,
                  ),
                  GestureDetector(
                    onTap: () => provider.clearSelection(),
                    child: Text(
                      'Clear All',
                      style: AppTextStyles.labelMedium
                          .copyWith(color: AppColors.error),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.sm),
              Wrap(
                spacing: AppSizes.sm,
                runSpacing: AppSizes.xs,
                children: provider.selectedIngredients.map((ingredient) {
                  return Chip(
                    label: Text(
                      '${ingredient.icon} ${ingredient.name}',
                      style: AppTextStyles.labelMedium
                          .copyWith(color: AppColors.primaryDark),
                    ),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    deleteIconColor: AppColors.primaryDark,
                    onDeleted: () => provider.removeIngredient(ingredient),
                    backgroundColor: AppColors.accentSurface,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSizes.radiusFull),
                    ),
                  );
                }).toList(),
              ),
              const Divider(height: AppSizes.md),
            ],
          ),
        );
      },
    );
  }
}
