import 'package:flutter/material.dart';
import 'package:list_app/listscreen.dart';
import 'package:list_app/textinputscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100 Days of Flutter',
      home: ListScreen(),
      routes: {
        '/list': (context) => ListScreen(),
        '/input': (context) => TextInputScreen()
        },
    );
  }
}

