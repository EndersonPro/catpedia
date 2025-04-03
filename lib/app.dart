import 'package:catpedia/presentation/shared/theme/theme.dart';
import 'package:flutter/material.dart';

class CatPediaApp extends StatelessWidget {
  const CatPediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CatPediaThemes.lightTheme(),
      home: Scaffold(body: Center(child: Text("App"))),
    );
  }
}
