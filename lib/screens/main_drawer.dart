import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);

    return Drawer(
      child: Column(
        children: [
          Container(
            height: _mediaQuery.size.height * 0.15,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          _buildDrawerItem(Icons.restaurant, 'Meals',
              () => Navigator.pushReplacementNamed(context, Routes.homeRoute)),
          _buildDrawerItem(Icons.settings, 'Settings',
              () => Navigator.pushReplacementNamed(context, Routes.FiltersRoute)),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      IconData _icon, String _itemName, Function _handlerName) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        onTap: _handlerName,
        leading: Icon(
          _icon,
          size: 26,
        ),
        title: Text(
          _itemName,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
