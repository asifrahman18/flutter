import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.mealsFavouriteToggle});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) mealsFavouriteToggle;

  void _selectedMeal(Meal meal, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          title: meal.title,
          meal: meal,
          mealsFavouriteToggle: mealsFavouriteToggle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget display = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
            selectedMeal: (meal) {
              _selectedMeal(meal, context);
            },
          );
        });

    if (meals.isEmpty) {
      display = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('No Meals added',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            Text(
              'Try adding some',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return display;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
        ),
      ),
      body: display,
    );
  }
}
