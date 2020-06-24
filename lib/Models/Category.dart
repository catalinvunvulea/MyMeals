import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {@required this.id,
      @required this.title,
      this.color = Colors
          .orange}); // = Colors.orange -> this is the default color in case we don't receive a custom one

}
