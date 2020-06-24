import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('My meals'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(
            title: catData.title,
            color: catData.color,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // give a max width
          childAspectRatio: 3 / 2, //ex for 200 width we will have 300 height
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
