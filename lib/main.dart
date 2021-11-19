import 'package:flutter/material.dart';
import 'package:houlak/screens/artist_detail_screen.dart';
import 'package:houlak/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/home',
      routes: {
        '/home' : (BuildContext context) => Home(),
        '/artist_detail' : (BuildContext context) => ArtistDetail()
      },
    );
  }
}
