import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:bgsearchapp/3_presentation/pages/favourites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/game_search.dart';
import 'pages/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final screens = [GameSearch(), FavouritesPage(), Settings()];

  @override
  Widget build(BuildContext context) {
    int index = context.watch<StateManager>().pageIndex;

    return SafeArea(
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) => context.read<StateManager>().setPageIndex(index),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: 'Game Search'),
            NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                selectedIcon: Icon(Icons.favorite),
                label: 'Favourites'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
