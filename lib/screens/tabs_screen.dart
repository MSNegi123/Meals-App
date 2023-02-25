import 'package:flutter/material.dart';
import 'package:meals_app/models/mealModel.dart';

import './favourites_screen.dart';
import './categories_screen.dart';
import './main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<MealModel> _favouriteMeals;

  const TabsScreen(this._favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': Categories(), 'title': 'Categories'},
      {'page': Favourites(widget._favouriteMeals), 'title': 'Your Favourites'}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer:MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Your Favourites'),
        ],
      ),
    );
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
