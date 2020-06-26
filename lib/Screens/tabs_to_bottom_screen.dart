import 'package:flutter/material.dart';

import './favourites_screen.dart';
import './categories_screen.dart';

class TabsToBottomScreen extends StatefulWidget {
  //requiered only if we add tabs at the bottom
  TabsToBottomScreen({Key key}) : super(key: key);

  @override
  _TabsToBarScreenState createState() => _TabsToBarScreenState();
}

class _TabsToBarScreenState extends State<TabsToBottomScreen> {
  
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Your favourites'},
  ];

  int _selectedPageIndex = 0;

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
        title: Center(
          child: Text(_pages[_selectedPageIndex]['title']),
        ),
      ),
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
