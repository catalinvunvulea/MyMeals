import './category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/category-meals', //the identifier of the screen
      arguments: {'id': id, 'title': title}, //we passed this map{} as arguments for this screen 
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //it's jut like a gesture detector but return a rinkle effect on tap
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(
          15), //the waves should follow the radius of the container
      child: Container(
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //grtadient starting the firs color to the second
                color.withOpacity(0.3), //first color
                color, //second color
              ],
              begin: Alignment.topLeft, //gradient will begin from topLeft
              end: Alignment.bottomRight, // and will end to bottomRight
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
