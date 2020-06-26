import 'package:flutter/material.dart';

import '../Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 90,
          color: Colors.orange,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment
              .centerLeft, //controlls how the child of the container is allignet inside
          child: Text(
            'Cooking Up',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile(
          'Meals',
          Icons.restaurant,
          () {
            Navigator.of(context)
                .pushNamed('/'); //'/' is the identifier for CategoriesScreen
          },
        ),
        buildListTile(
          'Filters',
          Icons.filter_list,
          () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          },
        )
      ],
    ));
  }
}
