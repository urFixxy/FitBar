import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../providers/ingredient_provider.dart';

class IngredientSearchField extends StatelessWidget {
  const IngredientSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<IngredientProvider>().updateSearch(value);
      },
      decoration: InputDecoration(
        hintText: 'Search ingredients...',
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.textHint,
        ),
        suffixIcon: Consumer<IngredientProvider>(
          builder: (context, provider, _) {
            if (provider.searchQuery.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.close_rounded, size: 20),
              onPressed: () {
                provider.updateSearch('');
              },
            );
          },
        ),
        filled: true,
        fillColor: AppColors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.md,
          vertical: AppSizes.md,
        ),
      ),
    );
  }
}
