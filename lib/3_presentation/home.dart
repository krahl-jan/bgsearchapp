import 'package:flutter/material.dart';

import 'pages/favourite.dart';
import 'pages/search.dart';
import 'pages/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final screens = [Search(), Favourite(), Settings()];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('BottomNavigationBar Demo'),
        ),
        body: screens[index],
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }), //TODO: replace with provider
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: 'Game Search'),
            NavigationDestination(
                icon: Icon(Icons.star_border_outlined),
                selectedIcon: Icon(Icons.star),
                label: 'Favourites'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings'),
          ],
        ),
      );
}
