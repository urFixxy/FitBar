import '../models/recipe.dart';
import '../models/nutrition.dart';

class DummyRecipes {
  DummyRecipes._();

  static const List<Recipe> all = [
    Recipe(
      id: 'r001',
      title: 'Classic Fried Rice',
      description:
          'A quick and flavorful fried rice loaded with vegetables and egg. Perfect for using up leftover rice.',
      imageUrl: 'assets/images/fried_rice.png',
      ingredients: ['rice', 'egg', 'garlic', 'onion', 'soy_sauce', 'carrot', 'cooking_oil', 'salt', 'pepper'],
      steps: [
        'Heat cooking oil in a wok over high heat.',
        'Sauté minced garlic and diced onion until fragrant.',
        'Push to the side, scramble the egg in the wok.',
        'Add diced carrots and stir-fry for 1 minute.',
        'Add cold rice and break up any clumps.',
        'Season with soy sauce, salt, and pepper.',
        'Stir-fry everything together for 3-4 minutes.',
        'Serve hot with sliced cucumber on the side.',
      ],
      cookingTime: 15,
      servings: 2,
      difficulty: 'Easy',
      category: 'Lunch',
      nutrition: Nutrition(calories: 350, protein: 12, carbs: 52, fat: 10, fiber: 2),
      rating: 4.5,
    ),

    Recipe(
      id: 'r002',
      title: 'Chicken Stir-Fry',
      description:
          'Tender chicken pieces stir-fried with colorful vegetables in a savory sauce.',
      imageUrl: 'assets/images/chicken_stirfry.png',
      ingredients: ['chicken', 'broccoli', 'bell_pepper', 'garlic', 'soy_sauce', 'oyster_sauce', 'cooking_oil', 'corn'],
      steps: [
        'Cut chicken into bite-sized pieces and season with salt.',
        'Heat oil in a wok, cook chicken until golden. Set aside.',
        'In the same wok, sauté garlic until fragrant.',
        'Add broccoli, bell pepper, and corn. Stir-fry for 2 minutes.',
        'Return chicken to the wok.',
        'Add soy sauce and oyster sauce, toss everything together.',
        'Cook for another 2 minutes until sauce thickens.',
        'Serve over steamed rice.',
      ],
      cookingTime: 20,
      servings: 3,
      difficulty: 'Easy',
      category: 'Dinner',
      nutrition: Nutrition(calories: 280, protein: 28, carbs: 15, fat: 12, fiber: 4),
      rating: 4.7,
    ),

    Recipe(
      id: 'r003',
      title: 'Creamy Tomato Pasta',
      description:
          'Rich and creamy tomato pasta that comes together in under 25 minutes.',
      imageUrl: 'assets/images/tomato_pasta.png',
      ingredients: ['pasta', 'tomato', 'garlic', 'onion', 'cheese', 'butter', 'milk', 'salt', 'pepper'],
      steps: [
        'Cook pasta according to package directions. Drain and set aside.',
        'Melt butter in a pan, sauté onion and garlic until soft.',
        'Add diced tomatoes and cook for 5 minutes.',
        'Pour in milk and stir until creamy.',
        'Season with salt and pepper.',
        'Add cooked pasta and toss to coat.',
        'Top with grated cheese and serve immediately.',
      ],
      cookingTime: 25,
      servings: 2,
      difficulty: 'Easy',
      category: 'Dinner',
      nutrition: Nutrition(calories: 420, protein: 14, carbs: 58, fat: 16, fiber: 3),
      rating: 4.3,
    ),

    Recipe(
      id: 'r004',
      title: 'Avocado Toast',
      description:
          'Simple yet delicious avocado toast topped with a fried egg and chili flakes.',
      imageUrl: 'assets/images/avocado_toast.png',
      ingredients: ['avocado', 'bread', 'egg', 'lemon', 'chili', 'salt', 'pepper'],
      steps: [
        'Toast the bread slices until golden and crispy.',
        'Mash avocado with a fork, add lemon juice, salt and pepper.',
        'Fry eggs sunny side up in a non-stick pan.',
        'Spread avocado mash on toast.',
        'Top with the fried egg.',
        'Sprinkle with chili flakes and serve.',
      ],
      cookingTime: 10,
      servings: 1,
      difficulty: 'Easy',
      category: 'Breakfast',
      nutrition: Nutrition(calories: 310, protein: 12, carbs: 28, fat: 18, fiber: 7),
      rating: 4.6,
    ),

    Recipe(
      id: 'r005',
      title: 'Spicy Shrimp Noodles',
      description:
          'Spicy and savory stir-fried noodles with plump shrimp and fresh vegetables.',
      imageUrl: 'assets/images/shrimp_noodles.png',
      ingredients: ['shrimp', 'noodles', 'garlic', 'chili', 'soy_sauce', 'bean_sprouts', 'cooking_oil', 'onion'],
      steps: [
        'Cook noodles according to package. Drain and set aside.',
        'Heat oil, sauté garlic and sliced chili until fragrant.',
        'Add shrimp and cook until pink, about 2 minutes each side.',
        'Add bean sprouts and sliced onion, stir-fry for 1 minute.',
        'Toss in noodles and season with soy sauce.',
        'Stir-fry everything on high heat for 2 minutes.',
        'Serve immediately while hot.',
      ],
      cookingTime: 20,
      servings: 2,
      difficulty: 'Medium',
      category: 'Lunch',
      nutrition: Nutrition(calories: 380, protein: 22, carbs: 48, fat: 12, fiber: 2),
      rating: 4.4,
    ),

    Recipe(
      id: 'r006',
      title: 'Banana Oat Pancakes',
      description:
          'Healthy and fluffy pancakes made with oats and banana. No flour needed!',
      imageUrl: 'assets/images/banana_pancakes.png',
      ingredients: ['banana', 'oats', 'egg', 'milk', 'honey', 'cinnamon', 'butter'],
      steps: [
        'Blend oats into fine flour using a blender.',
        'Mash banana in a bowl until smooth.',
        'Mix in eggs, milk, oat flour, and cinnamon.',
        'Heat a non-stick pan with a little butter.',
        'Pour batter to form pancakes, cook 2 minutes each side.',
        'Stack pancakes and drizzle with honey.',
        'Serve warm with fresh fruit.',
      ],
      cookingTime: 15,
      servings: 2,
      difficulty: 'Easy',
      category: 'Breakfast',
      nutrition: Nutrition(calories: 250, protein: 10, carbs: 38, fat: 7, fiber: 4),
      rating: 4.8,
    ),

    Recipe(
      id: 'r007',
      title: 'Tofu Curry',
      description:
          'A rich and aromatic coconut tofu curry with a blend of warming spices.',
      imageUrl: 'assets/images/tofu_curry.png',
      ingredients: ['tofu', 'coconut_milk', 'onion', 'garlic', 'ginger', 'turmeric', 'chili', 'tomato', 'spinach', 'cooking_oil'],
      steps: [
        'Cut tofu into cubes and pan-fry until golden. Set aside.',
        'Sauté onion, garlic, and ginger in oil until soft.',
        'Add turmeric and chili, stir for 30 seconds.',
        'Add diced tomatoes and cook for 3 minutes.',
        'Pour in coconut milk and bring to a simmer.',
        'Add fried tofu and spinach, cook for 5 minutes.',
        'Season with salt and serve with steamed rice.',
      ],
      cookingTime: 30,
      servings: 3,
      difficulty: 'Medium',
      category: 'Dinner',
      nutrition: Nutrition(calories: 320, protein: 16, carbs: 18, fat: 22, fiber: 4),
      rating: 4.5,
    ),

    Recipe(
      id: 'r008',
      title: 'Egg Drop Soup',
      description:
          'A comforting and silky egg drop soup that is ready in minutes.',
      imageUrl: 'assets/images/egg_drop_soup.png',
      ingredients: ['egg', 'garlic', 'ginger', 'corn', 'salt', 'pepper', 'onion'],
      steps: [
        'Bring 3 cups of water to a boil in a pot.',
        'Add minced garlic, ginger, and corn kernels.',
        'Simmer for 5 minutes.',
        'Beat eggs in a small bowl.',
        'Slowly drizzle beaten eggs into the simmering soup while stirring.',
        'Season with salt and pepper.',
        'Garnish with sliced green onion and serve hot.',
      ],
      cookingTime: 10,
      servings: 2,
      difficulty: 'Easy',
      category: 'Lunch',
      nutrition: Nutrition(calories: 120, protein: 8, carbs: 10, fat: 5, fiber: 1),
      rating: 4.2,
    ),

    Recipe(
      id: 'r009',
      title: 'Beef & Mushroom Bowl',
      description:
          'Juicy sliced beef with sautéed mushrooms served over fluffy rice.',
      imageUrl: 'assets/images/beef_mushroom.png',
      ingredients: ['beef', 'mushroom', 'rice', 'garlic', 'onion', 'soy_sauce', 'butter', 'pepper'],
      steps: [
        'Slice beef thinly and season with soy sauce and pepper.',
        'Cook rice and set aside.',
        'Melt butter in a hot pan, sear beef slices for 1-2 minutes each side. Set aside.',
        'In the same pan, sauté garlic, onion, and sliced mushrooms.',
        'Return beef to the pan and toss together.',
        'Add a splash of soy sauce for extra flavor.',
        'Serve beef and mushrooms over a bowl of rice.',
      ],
      cookingTime: 25,
      servings: 2,
      difficulty: 'Medium',
      category: 'Dinner',
      nutrition: Nutrition(calories: 450, protein: 32, carbs: 45, fat: 16, fiber: 2),
      rating: 4.6,
    ),

    Recipe(
      id: 'r010',
      title: 'Mango Smoothie Bowl',
      description:
          'A refreshing and vibrant smoothie bowl topped with fresh fruits and oats.',
      imageUrl: 'assets/images/mango_smoothie.png',
      ingredients: ['mango', 'banana', 'yogurt', 'honey', 'oats'],
      steps: [
        'Blend frozen mango and banana with yogurt until thick and smooth.',
        'Pour into a bowl.',
        'Top with oats, sliced banana, and mango chunks.',
        'Drizzle with honey.',
        'Serve immediately and enjoy!',
      ],
      cookingTime: 5,
      servings: 1,
      difficulty: 'Easy',
      category: 'Breakfast',
      nutrition: Nutrition(calories: 280, protein: 8, carbs: 52, fat: 4, fiber: 5),
      rating: 4.9,
    ),

    Recipe(
      id: 'r011',
      title: 'Tempeh Stir-Fry',
      description:
          'Crispy fried tempeh tossed in a sweet and savory soy glaze.',
      imageUrl: 'assets/images/tempeh_stirfry.png',
      ingredients: ['tempeh', 'soy_sauce', 'garlic', 'chili', 'sugar', 'cooking_oil', 'onion'],
      steps: [
        'Slice tempeh into thin pieces.',
        'Heat oil and fry tempeh until golden and crispy. Set aside.',
        'In a small pan, sauté garlic, onion, and chili.',
        'Add soy sauce and a pinch of sugar, simmer for 1 minute.',
        'Toss fried tempeh in the sauce until well coated.',
        'Serve as a side dish with steamed rice.',
      ],
      cookingTime: 15,
      servings: 2,
      difficulty: 'Easy',
      category: 'Lunch',
      nutrition: Nutrition(calories: 220, protein: 18, carbs: 12, fat: 12, fiber: 3),
      rating: 4.3,
    ),

    Recipe(
      id: 'r012',
      title: 'Cheesy Potato Gratin',
      description:
          'Layers of thinly sliced potato baked in a creamy cheese sauce until golden.',
      imageUrl: 'assets/images/potato_gratin.png',
      ingredients: ['potato', 'cheese', 'milk', 'butter', 'garlic', 'salt', 'pepper'],
      steps: [
        'Preheat oven to 200°C (390°F).',
        'Peel and thinly slice potatoes.',
        'In a saucepan, melt butter and sauté garlic.',
        'Add milk and half the cheese, stir until melted.',
        'Layer potato slices in a baking dish, pour cheese sauce over each layer.',
        'Top with remaining cheese.',
        'Bake for 35-40 minutes until golden and bubbling.',
        'Let rest 5 minutes before serving.',
      ],
      cookingTime: 50,
      servings: 4,
      difficulty: 'Medium',
      category: 'Dinner',
      nutrition: Nutrition(calories: 380, protein: 14, carbs: 40, fat: 18, fiber: 3),
      rating: 4.7,
    ),
  ];

  /// Get recipes filtered by category.
  static List<Recipe> getByCategory(String category) {
    return all.where((r) => r.category == category).toList();
  }

  /// Get popular recipes (rating >= 4.5).
  static List<Recipe> getPopular() {
    return all.where((r) => r.rating >= 4.5).toList();
  }

  /// Search recipes matching any of the selected ingredient IDs.
  static List<Recipe> searchByIngredients(List<String> ingredientIds) {
    if (ingredientIds.isEmpty) return [];
    final selectedLower = ingredientIds.map((e) => e.toLowerCase()).toSet();

    final matched = <Recipe, int>{};
    for (final recipe in all) {
      int count = 0;
      for (final ri in recipe.ingredients) {
        if (selectedLower.contains(ri.toLowerCase())) {
          count++;
        }
      }
      if (count > 0) {
        matched[recipe] = count;
      }
    }

    // Sort by number of matching ingredients (descending)
    final sorted = matched.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.map((e) => e.key).toList();
  }
}
