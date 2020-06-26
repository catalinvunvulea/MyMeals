import 'package:flutter/material.dart';

import './favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0, // which tab to be selected first
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Meals')),
          bottom: TabBar(
            indicatorColor: Colors.yellow[50], // color of the line under the TabBar
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //need to add as many widgets as we have tabs (in this case 2)
            CategoriesScreen(), FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
