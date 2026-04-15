import '../models/ingredient.dart';

class DummyIngredients {
  DummyIngredients._();

  static const List<Ingredient> all = [
    // Protein
    Ingredient(id: 'chicken', name: 'Chicken', category: 'Protein', icon: '🍗'),
    Ingredient(id: 'egg', name: 'Egg', category: 'Protein', icon: '🥚'),
    Ingredient(id: 'beef', name: 'Beef', category: 'Protein', icon: '🥩'),
    Ingredient(id: 'shrimp', name: 'Shrimp', category: 'Protein', icon: '🦐'),
    Ingredient(id: 'tofu', name: 'Tofu', category: 'Protein', icon: '🧈'),
    Ingredient(id: 'fish', name: 'Fish', category: 'Protein', icon: '🐟'),
    Ingredient(id: 'tempeh', name: 'Tempeh', category: 'Protein', icon: '🫘'),

    // Vegetables
    Ingredient(id: 'tomato', name: 'Tomato', category: 'Vegetables', icon: '🍅'),
    Ingredient(id: 'onion', name: 'Onion', category: 'Vegetables', icon: '🧅'),
    Ingredient(id: 'garlic', name: 'Garlic', category: 'Vegetables', icon: '🧄'),
    Ingredient(id: 'carrot', name: 'Carrot', category: 'Vegetables', icon: '🥕'),
    Ingredient(id: 'potato', name: 'Potato', category: 'Vegetables', icon: '🥔'),
    Ingredient(id: 'broccoli', name: 'Broccoli', category: 'Vegetables', icon: '🥦'),
    Ingredient(id: 'spinach', name: 'Spinach', category: 'Vegetables', icon: '🥬'),
    Ingredient(id: 'cabbage', name: 'Cabbage', category: 'Vegetables', icon: '🥬'),
    Ingredient(id: 'bean_sprouts', name: 'Bean Sprouts', category: 'Vegetables', icon: '🌱'),
    Ingredient(id: 'bell_pepper', name: 'Bell Pepper', category: 'Vegetables', icon: '🫑'),
    Ingredient(id: 'mushroom', name: 'Mushroom', category: 'Vegetables', icon: '🍄'),
    Ingredient(id: 'corn', name: 'Corn', category: 'Vegetables', icon: '🌽'),

    // Fruits
    Ingredient(id: 'banana', name: 'Banana', category: 'Fruits', icon: '🍌'),
    Ingredient(id: 'apple', name: 'Apple', category: 'Fruits', icon: '🍎'),
    Ingredient(id: 'lemon', name: 'Lemon', category: 'Fruits', icon: '🍋'),
    Ingredient(id: 'avocado', name: 'Avocado', category: 'Fruits', icon: '🥑'),
    Ingredient(id: 'mango', name: 'Mango', category: 'Fruits', icon: '🥭'),

    // Dairy
    Ingredient(id: 'milk', name: 'Milk', category: 'Dairy', icon: '🥛'),
    Ingredient(id: 'cheese', name: 'Cheese', category: 'Dairy', icon: '🧀'),
    Ingredient(id: 'butter', name: 'Butter', category: 'Dairy', icon: '🧈'),
    Ingredient(id: 'yogurt', name: 'Yogurt', category: 'Dairy', icon: '🥛'),

    // Grains
    Ingredient(id: 'rice', name: 'Rice', category: 'Grains', icon: '🍚'),
    Ingredient(id: 'noodles', name: 'Noodles', category: 'Grains', icon: '🍜'),
    Ingredient(id: 'bread', name: 'Bread', category: 'Grains', icon: '🍞'),
    Ingredient(id: 'flour', name: 'Flour', category: 'Grains', icon: '🌾'),
    Ingredient(id: 'pasta', name: 'Pasta', category: 'Grains', icon: '🍝'),
    Ingredient(id: 'oats', name: 'Oats', category: 'Grains', icon: '🥣'),

    // Spices
    Ingredient(id: 'salt', name: 'Salt', category: 'Spices', icon: '🧂'),
    Ingredient(id: 'pepper', name: 'Pepper', category: 'Spices', icon: '🌶️'),
    Ingredient(id: 'chili', name: 'Chili', category: 'Spices', icon: '🌶️'),
    Ingredient(id: 'ginger', name: 'Ginger', category: 'Spices', icon: '🫚'),
    Ingredient(id: 'turmeric', name: 'Turmeric', category: 'Spices', icon: '🟡'),
    Ingredient(id: 'cinnamon', name: 'Cinnamon', category: 'Spices', icon: '🟤'),

    // Sauces
    Ingredient(id: 'soy_sauce', name: 'Soy Sauce', category: 'Sauces', icon: '🫗'),
    Ingredient(id: 'oyster_sauce', name: 'Oyster Sauce', category: 'Sauces', icon: '🫗'),
    Ingredient(id: 'tomato_sauce', name: 'Tomato Sauce', category: 'Sauces', icon: '🥫'),
    Ingredient(id: 'chili_sauce', name: 'Chili Sauce', category: 'Sauces', icon: '🌶️'),
    Ingredient(id: 'coconut_milk', name: 'Coconut Milk', category: 'Sauces', icon: '🥥'),

    // Others
    Ingredient(id: 'sugar', name: 'Sugar', category: 'Others', icon: '🍬'),
    Ingredient(id: 'cooking_oil', name: 'Cooking Oil', category: 'Others', icon: '🫒'),
    Ingredient(id: 'honey', name: 'Honey', category: 'Others', icon: '🍯'),
    Ingredient(id: 'peanut', name: 'Peanut', category: 'Others', icon: '🥜'),
  ];

  static List<Ingredient> getByCategory(String category) {
    return all.where((i) => i.category == category).toList();
  }

  static List<Ingredient> search(String query) {
    if (query.isEmpty) return all;
    return all
        .where((i) => i.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
