import 'package:catpedia/presentation/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/core.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

class CatPediaApp extends StatelessWidget {
  const CatPediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CatPediaThemes.lightTheme(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en')],
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
