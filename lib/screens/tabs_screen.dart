import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import 'favorites_screen.dart';
import '../models/meals.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;

  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'My Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColorDark,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
