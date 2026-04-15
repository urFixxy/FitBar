import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_text_styles.dart';

import '../../recipes/providers/recipe_provider.dart';
import '../../recipes/screens/recipe_detail_screen.dart';
import '../widgets/greeting_header.dart';
import '../widgets/quick_search_bar.dart';
import '../widgets/popular_recipe_card.dart';
import '../widgets/category_chips.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecipeProvider>().loadRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingHeader(),
              const SizedBox(height: AppSizes.lg),
              const QuickSearchBar(),
              const SizedBox(height: AppSizes.lg),

              // Category filter
              Text('Categories', style: AppTextStyles.h4),
              const SizedBox(height: AppSizes.sm),
              const CategoryChips(),
              const SizedBox(height: AppSizes.lg),

              // Popular Recipes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Recipes', style: AppTextStyles.h4),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: AppTextStyles.labelMedium
                          .copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.sm),
              Consumer<RecipeProvider>(
                builder: (context, provider, _) {
                  final popular = provider.popularRecipes;
                  return SizedBox(
                    height: AppSizes.recipeCardHeight + 30,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: popular.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(width: AppSizes.sm),
                      itemBuilder: (context, index) {
                        return PopularRecipeCard(
                          recipe: popular[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RecipeDetailScreen(
                                  recipe: popular[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSizes.lg),

              // Quick tip
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  gradient: AppColors.heroGradient,
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                ),
                child: Row(
                  children: [
                    const Text('💡', style: TextStyle(fontSize: 32)),
                    const SizedBox(width: AppSizes.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Got leftover ingredients?',
                            style: AppTextStyles.labelLarge
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Head to the Ingredients tab to find recipes you can make right now!',
                            style: AppTextStyles.bodySmall
                                .copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.lg),
            ],
          ),
        ),
      ),
    );
  }
}
