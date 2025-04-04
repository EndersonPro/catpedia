import 'package:catpedia/presentation/shared/theme/theme.dart';
import 'package:flutter/material.dart';

import 'core/core.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

class CatPediaApp extends StatelessWidget {
  const CatPediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CatPediaThemes.lightTheme(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CatPediaRoutes.home:
            return MaterialPageRoute(builder: (context) => const HomePage());
          case CatPediaRoutes.catDetails:
            final breed = settings.arguments as Breed;
            return MaterialPageRoute(
              builder: (context) => CatBreedDetail(breed: breed),
            );
        }
      },
    );
  }
}
