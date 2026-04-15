import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/helpers.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../favorites/providers/favorites_provider.dart';
import '../providers/recipe_provider.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatefulWidget {
  final List<String> ingredientIds;

  const RecipeListScreen({
    super.key,
    required this.ingredientIds,
  });

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecipeProvider>().searchByIngredients(widget.ingredientIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Results'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.md),
            child: Center(
              child: Consumer<RecipeProvider>(
                builder: (context, provider, _) {
                  return Text(
                    '${provider.searchResults.length} found',
                    style: AppTextStyles.labelMedium
                        .copyWith(color: AppColors.primary),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, provider, _) {
          if (provider.searchResults.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.no_meals_rounded,
              title: 'No Recipes Found',
              subtitle:
                  'Try selecting different ingredients to find matching recipes.',
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppSizes.md),
            itemCount: provider.searchResults.length,
            separatorBuilder: (_, _) =>
                const SizedBox(height: AppSizes.sm),
            itemBuilder: (context, index) {
              final recipe = provider.searchResults[index];
              final matchCount =
                  provider.getMatchCount(recipe, widget.ingredientIds);
              final matchPercent =
                  provider.getMatchPercentage(recipe, widget.ingredientIds);

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RecipeDetailScreen(recipe: recipe),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius:
                        BorderRadius.circular(AppSizes.radiusMd),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      // Image placeholder
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.primarySurface,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(AppSizes.radiusMd),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _getCategoryEmoji(recipe.category),
                            style: const TextStyle(fontSize: 36),
                          ),
                        ),
                      ),

                      // Content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.sm),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.title,
                                style: AppTextStyles.labelLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.timer_outlined,
                                      size: 14,
                                      color: AppColors.textHint),
                                  const SizedBox(width: 4),
                                  Text(
                                    Helpers.formatDuration(recipe.cookingTime),
                                    style: AppTextStyles.caption,
                                  ),
                                  const SizedBox(width: AppSizes.sm),
                                  Icon(Icons.local_fire_department_outlined,
                                      size: 14,
                                      color: AppColors.textHint),
                                  const SizedBox(width: 4),
                                  Text(
                                    Helpers.formatCalories(
                                        recipe.nutrition.calories),
                                    style: AppTextStyles.caption,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              // Match indicator
                              Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: LinearProgressIndicator(
                                        value: matchPercent / 100,
                                        backgroundColor:
                                            AppColors.surfaceVariant,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          matchPercent >= 75
                                              ? AppColors.success
                                              : matchPercent >= 50
                                                  ? AppColors.warning
                                                  : AppColors.accent,
                                        ),
                                        minHeight: 6,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppSizes.sm),
                                  Text(
                                    '$matchCount/${recipe.ingredients.length}',
                                    style: AppTextStyles.caption.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Favorite button
                      Consumer<FavoritesProvider>(
                        builder: (context, favProvider, _) {
                          final isFav = favProvider.isFavorite(recipe.id);
                          return IconButton(
                            icon: Icon(
                              isFav
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color:
                                  isFav ? AppColors.error : AppColors.textHint,
                            ),
                            onPressed: () =>
                                favProvider.toggleFavorite(recipe.id),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _getCategoryEmoji(String category) {
    switch (category) {
      case 'Breakfast':
        return '🥞';
      case 'Lunch':
        return '🍛';
      case 'Dinner':
        return '🍽️';
      case 'Snack':
        return '🍿';
      case 'Dessert':
        return '🍰';
      default:
        return '🍲';
    }
  }
}
