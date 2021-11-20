import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String title;

  const CategoryContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:40,left: 16,bottom: 20),
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.bold)),
    );
  }
}