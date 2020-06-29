import 'package:MyMeals/Screens/tabs_to_bar_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsToBottomScreen extends StatefulWidget {
  //requiered only if we add tabs at the bottom
  final List<Meal> favouriteMeals;

  TabsToBottomScreen(this.favouriteMeals);

  @override
  _TabsToBarScreenState createState() => _TabsToBarScreenState();
}

class _TabsToBarScreenState extends State<TabsToBottomScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your favourites'
      },
    ];
  }

  void _selectPage(int index) {
    //flutter will automatically pass in the index, no need to manually do it
    setState(() {
      //this is why we need the statefull widget, as we will manually change the state of _selectedPageIndex
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectPage, //no need to manually pass in the index of the selected tab
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex:
            _selectedPageIndex, //as we manually feed the selected index, we need to specify which one it is
        type: BottomNavigationBarType
            .shifting, //if we use shifting we need to style each navigation bar, ot at least the firs
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          )
        ],
      ),
    );
  }
}
