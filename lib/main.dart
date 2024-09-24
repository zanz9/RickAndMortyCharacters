import 'package:flutter/material.dart';
import 'package:kdigital_test/src/core/di/di_init.dart';
import 'package:kdigital_test/src/features/character/presentation/screen/character_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick And Morty Characters',
      home: const CharactersScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
