import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.search_off),
          Text('No hay resultados'),
        ],
      ),
    );
  }
}
