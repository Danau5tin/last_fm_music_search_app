import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_fm_music_search_app/core/navigation/route_generator.dart';
import 'package:last_fm_music_search_app/service_locator.dart';

import 'features/album/album_search/presentation/screens/search_screen.dart';


void main() {
  setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music search app',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme()),
      onGenerateRoute: (settings) => RouteGenerator().generateRoute(settings),
      home: const SafeArea(
        child: SearchScreen(),
      ),
    );
  }
}
