import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:houlak/bloc/player/player_bloc.dart';

import 'package:houlak/screens/artist_detail_screen.dart';
import 'package:houlak/screens/home_screen.dart';

import 'bloc/artist/artist_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ArtistBloc()),
        BlocProvider(create: (context) => PlayerBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': (BuildContext context) => Home(),
          '/artist_detail': (BuildContext context) => ArtistDetail()
        },
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).primaryTextTheme
          )
        ),
      ),
    );
  }
}
