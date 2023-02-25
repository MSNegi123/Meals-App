import 'package:flutter/material.dart';

import './main_drawer.dart';

class Filters extends StatefulWidget {
  final Map<String, bool> _filtersData;
  final Function _setMealsFilter;

  const Filters(this._filtersData, this._setMealsFilter);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget._filtersData['gluten'];
    _vegan = widget._filtersData['vegan'];
    _vegetarian = widget._filtersData['vegetarian'];
    _lactoseFree = widget._filtersData['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters Screen'),
        actions: [IconButton(icon: Icon(Icons.save), onPressed:(){
      var _selectedFilters = {
        'gluten': _glutenFree,
        'vegan': _vegan,
        'vegetarian': _vegetarian,
        'lactose': _lactoseFree
      };
      widget._setMealsFilter(_selectedFilters);
    })],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'Select your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _buildSwitch(
              title: 'Gluten Free',
              desc: 'Select only gluten-free meals.',
              oldValue: _glutenFree,
              onChanged: (newValue) => setState(() => _glutenFree = newValue)),
          _buildSwitch(
              title: 'Vegan Free',
              desc: 'Select only vegan-free meals.',
              oldValue: _vegan,
              onChanged: (newValue) => setState(() => _vegan = newValue)),
          _buildSwitch(
              title: 'Vegetarian',
              desc: 'Select only vegetarian meals.',
              oldValue: _vegetarian,
              onChanged: (newValue) => setState(() => _vegetarian = newValue)),
          _buildSwitch(
              title: 'Lactose Free',
              desc: 'Select only lactose-free meals.',
              oldValue: _lactoseFree,
              onChanged: (newValue) => setState(() => _lactoseFree = newValue)),
        ],
      ),
    );
  }

  Widget _buildSwitch(
      {String title, String desc, bool oldValue, Function onChanged}) {

    return SwitchListTile(
      value: oldValue,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(desc),
    );
  }
}
