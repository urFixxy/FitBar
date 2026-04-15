import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/ingredient.dart';
import '../../recipes/screens/recipe_list_screen.dart';
import '../providers/ingredient_provider.dart';
import '../widgets/ingredient_search_field.dart';
import '../widgets/selected_ingredients_list.dart';

class IngredientInputScreen extends StatefulWidget {
  const IngredientInputScreen({super.key});

  @override
  State<IngredientInputScreen> createState() => _IngredientInputScreenState();
}

class _IngredientInputScreenState extends State<IngredientInputScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<IngredientProvider>().loadIngredients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('What\'s in your fridge?', style: AppTextStyles.h2),
                  const SizedBox(height: 4),
                  Text(
                    'Select the ingredients you have',
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: AppSizes.md),
                  const IngredientSearchField(),
                ],
              ),
            ),

            // Selected ingredients
            const SelectedIngredientsList(),

            // Category tabs + ingredient grid
            Expanded(
              child: Consumer<IngredientProvider>(
                builder: (context, provider, _) {
                  return DefaultTabController(
                    length: IngredientCategory.all.length + 1,
                    child: Column(
                      children: [
                        // Category tabs
                        TabBar(
                          isScrollable: true,
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.textHint,
                          indicatorColor: AppColors.accent,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabAlignment: TabAlignment.start,
                          labelStyle: AppTextStyles.labelMedium,
                          tabs: [
                            const Tab(text: 'All'),
                            ...IngredientCategory.all
                                .map((c) => Tab(text: c)),
                          ],
                          onTap: (index) {
                            if (index == 0) {
                              provider.setCategory('All');
                            } else {
                              provider.setCategory(
                                  IngredientCategory.all[index - 1]);
                            }
                          },
                        ),

                        // Ingredient grid
                        Expanded(
                          child: provider.filteredIngredients.isEmpty
                              ? Center(
                                  child: Text(
                                    'No ingredients found',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textHint,
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  padding: const EdgeInsets.all(AppSizes.md),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: AppSizes.sm,
                                    mainAxisSpacing: AppSizes.sm,
                                  ),
                                  itemCount:
                                      provider.filteredIngredients.length,
                                  itemBuilder: (context, index) {
                                    final ingredient =
                                        provider.filteredIngredients[index];
                                    final isSelected =
                                        provider.isSelected(ingredient);
                                    return _IngredientTile(
                                      ingredient: ingredient,
                                      isSelected: isSelected,
                                      onTap: () =>
                                          provider.toggleIngredient(ingredient),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Search recipes FAB
      floatingActionButton: Consumer<IngredientProvider>(
        builder: (context, provider, _) {
          if (!provider.hasSelection) return const SizedBox.shrink();
          return FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RecipeListScreen(
                    ingredientIds: provider.selectedIngredientIds,
                  ),
                ),
              );
            },
            backgroundColor: AppColors.accent,
            foregroundColor: AppColors.primaryDark,
            icon: const Icon(Icons.search_rounded),
            label: Text(
              'Find Recipes (${provider.selectedCount})',
              style: AppTextStyles.button,
            ),
          );
        },
      ),
    );
  }
}

class _IngredientTile extends StatelessWidget {
  final Ingredient ingredient;
  final bool isSelected;
  final VoidCallback onTap;

  const _IngredientTile({
    required this.ingredient,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accentSurface : AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(
            color: isSelected ? AppColors.accent : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ingredient.icon, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 6),
            Text(
              ingredient.name,
              style: AppTextStyles.labelMedium.copyWith(
                color: isSelected
                    ? AppColors.accent
                    : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (isSelected)
              const Icon(Icons.check_circle, size: 16, color: AppColors.accent),
          ],
        ),
      ),
    );
  }
}
