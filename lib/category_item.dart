import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      decoration: BoxDecoration(
        boxShadow: BoxShadow.lerp(1, 1, 1),
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
    );
  }
}
