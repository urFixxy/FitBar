import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/helpers.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../recipes/screens/recipe_detail_screen.dart';
import '../providers/favorites_provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoritesProvider>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.favoriteRecipes.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.favorite_border_rounded,
              title: 'No Favorites Yet',
              subtitle:
                  'Save recipes you love and they\'ll appear here for quick access.',
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppSizes.md),
            itemCount: provider.favoriteRecipes.length,
            separatorBuilder: (_, _) =>
                const SizedBox(height: AppSizes.sm),
            itemBuilder: (context, index) {
              final recipe = provider.favoriteRecipes[index];
              return Dismissible(
                key: Key(recipe.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: AppSizes.lg),
                  decoration: BoxDecoration(
                    color: AppColors.error,
                    borderRadius:
                        BorderRadius.circular(AppSizes.radiusMd),
                  ),
                  child: const Icon(Icons.delete_rounded,
                      color: Colors.white),
                ),
                onDismissed: (_) {
                  provider.toggleFavorite(recipe.id);
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppSizes.sm),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius:
                          BorderRadius.circular(AppSizes.radiusMd),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColors.primarySurface,
                            borderRadius: BorderRadius.circular(
                                AppSizes.radiusSm),
                          ),
                          child: Center(
                            child: Text(
                              _getCategoryEmoji(recipe.category),
                              style: const TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(recipe.title,
                                  style: AppTextStyles.labelLarge),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.timer_outlined,
                                      size: 14,
                                      color: AppColors.textHint),
                                  const SizedBox(width: 4),
                                  Text(
                                    Helpers.formatDuration(
                                        recipe.cookingTime),
                                    style: AppTextStyles.caption,
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.star_rounded,
                                      size: 14,
                                      color: AppColors.warning),
                                  const SizedBox(width: 2),
                                  Text(
                                    recipe.rating.toString(),
                                    style: AppTextStyles.caption,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right_rounded,
                            color: AppColors.textHint),
                      ],
                    ),
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
