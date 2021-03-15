import 'package:flutter/material.dart';

import 'screens/waste_list_screen.dart';
import 'screens/new_waste_screen.dart';
import 'screens/waste_detail_screen.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wasteagram',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          WasteListScreen.routeName: (context) => WasteListScreen(),
          WasteDetailScreen.routeName: (context) => WasteDetailScreen(),
          NewWasteScreen.routeName: (context) => NewWasteScreen(),
        });
  }
}
