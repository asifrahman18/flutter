import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onSelectScreen});

  final void Function(String title) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Meals',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                )
              ],
            ),
          ),
          ListTile(
              leading: Icon(Icons.restaurant,
                  color: Theme.of(context).colorScheme.onBackground),
              title: Text(
                'Meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () {
                onSelectScreen('meals');
              }),
          ListTile(
              leading: Icon(Icons.settings,
                  color: Theme.of(context).colorScheme.onBackground),
              title: Text(
                'Filter',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              onTap: () {
                onSelectScreen('filter');
              }),
        ],
      ),
    );
  }
}
