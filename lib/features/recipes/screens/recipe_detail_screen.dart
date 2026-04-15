import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/helpers.dart';
import '../../../data/models/recipe.dart';
import '../../favorites/providers/favorites_provider.dart';
import '../widgets/nutrition_info_card.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero header
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.heroGradient,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Icon(
                        _getCategoryEmoji(recipe.category),
                        size: 64,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius:
                              BorderRadius.circular(AppSizes.radiusFull),
                        ),
                        child: Text(
                          recipe.category,
                          style: AppTextStyles.labelMedium
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              Consumer<FavoritesProvider>(
                builder: (context, provider, _) {
                  final isFav = provider.isFavorite(recipe.id);
                  return IconButton(
                    icon: Icon(
                      isFav
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFav ? AppColors.error : Colors.white,
                    ),
                    onPressed: () => provider.toggleFavorite(recipe.id),
                  );
                },
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & rating
                  Text(recipe.title, style: AppTextStyles.h2),
                  const SizedBox(height: 8),
                  Text(
                    recipe.description,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppSizes.md),

                  // Quick info chips
                  Row(
                    children: [
                      _InfoChip(
                        icon: Icons.timer_outlined,
                        label: Helpers.formatDuration(recipe.cookingTime),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      _InfoChip(
                        icon: Icons.restaurant_outlined,
                        label: '${recipe.servings} servings',
                      ),
                      const SizedBox(width: AppSizes.sm),
                      _InfoChip(
                        icon: Icons.trending_up_rounded,
                        label: recipe.difficulty,
                      ),
                      const SizedBox(width: AppSizes.sm),
                      _InfoChip(
                        icon: Icons.star_rounded,
                        label: recipe.rating.toString(),
                        iconColor: AppColors.warning,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.lg),

                  // Nutrition
                  Text('Nutrition Info', style: AppTextStyles.h4),
                  const SizedBox(height: AppSizes.sm),
                  NutritionInfoCard(nutrition: recipe.nutrition),
                  const SizedBox(height: AppSizes.lg),

                  // Ingredients list
                  Text('Ingredients', style: AppTextStyles.h4),
                  const SizedBox(height: AppSizes.sm),
                  ...recipe.ingredients.asMap().entries.map((entry) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppSizes.sm),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: AppSizes.sm),
                          Text(
                            Helpers.capitalize(
                                entry.value.replaceAll('_', ' ')),
                            style: AppTextStyles.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: AppSizes.lg),

                  // Steps
                  Text('How to Cook', style: AppTextStyles.h4),
                  const SizedBox(height: AppSizes.sm),
                  ...recipe.steps.asMap().entries.map((entry) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppSizes.md),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: AppColors.primarySurface,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${entry.key + 1}',
                                style:
                                    AppTextStyles.labelMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSizes.sm),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                entry.value,
                                style: AppTextStyles.bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: AppSizes.xl),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryEmoji(String category) {
    switch (category) {
      case 'Breakfast':
        return Icons.free_breakfast;
      case 'Lunch':
        return Icons.lunch_dining;
      case 'Dinner':
        return Icons.dinner_dining;
      case 'Snack':
        return Icons.fastfood;
      case 'Dessert':
        return Icons.icecream;
      default:
        return Icons.restaurant;
    }
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;

  const _InfoChip({
    required this.icon,
    required this.label,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: iconColor ?? AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
