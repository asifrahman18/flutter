import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/side_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selectedTabIndex = 0;
  final List<Meal> _favoutiteMeal = [];
  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onToggleFavourites(Meal meal) {
    final isExisting = _favoutiteMeal.contains(meal);

    if (isExisting) {
      setState(() {
        _favoutiteMeal.remove(meal);
        showInfoMessage('Removed from favourites');
      });
    } else {
      setState(() {
        _favoutiteMeal.add(meal);
        showInfoMessage('Added to favourites');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryScreen(
      mealsFavouriteToggle: _onToggleFavourites,
    );
    var activeScreenTitle = 'Categories';

    void onSelectScreen(String title) {
      if (title == 'filter') {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const FilterScreen()));
      } else {
        Navigator.of(context).pop();
      }
    }

    if (_selectedTabIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favoutiteMeal,
        mealsFavouriteToggle: _onToggleFavourites,
      );
      activeScreenTitle = 'My Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: SideDrawer(
        onSelectScreen: onSelectScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        onTap: _selectPage,
        currentIndex: _selectedTabIndex,
        elevation: 15,
        selectedItemColor: Color(Colors.cyan.value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoutites'),
        ],
      ),
    );
  }
}
