import 'package:flutter/material.dart';
import 'package:flutter_practice/Meals%20App/data/dummy.dart';
import 'package:flutter_practice/Meals%20App/screen/categories.dart';
import 'package:flutter_practice/Meals%20App/screen/meals.dart';
import 'package:flutter_practice/Meals%20App/screen/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),

);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: Tabsscreen(),
    );
  }
}