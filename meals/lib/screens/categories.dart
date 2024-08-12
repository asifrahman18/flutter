import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.mealsFavouriteToggle});
  final void Function(Meal meal) mealsFavouriteToggle;

  void _selectCategory(BuildContext context, Category category) {
    final filteredCategory = dummyMeals
        .where((meals) => meals.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredCategory,
            mealsFavouriteToggle: mealsFavouriteToggle,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10),
      children: [
        for (final data in availableCategories)
          CategoryGridItem(
            category: data,
            onSelectCategory: () {
              _selectCategory(context, data);
            },
          ),
      ],
    );
  }
}
