import 'package:catpedia/domain/domain.dart';
import 'package:catpedia/presentation/home/widgets/breeds_list.dart';
import 'package:catpedia/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ChipText has a text and title', (tester) async {
    //Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const ChipText(
            text: 'Tuxedo',
            title: 'Breed',
            textColor: Colors.black,
            titleColor: Colors.black,
          ),
        ),
      ),
    );

    //Act
    final textFinder = find.text('Tuxedo');
    final titleFinder = find.text('Breed');

    // Assert
    expect(titleFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
  });

  testWidgets('Show breed in list', (tester) async {
    //Arrange
    final breed = Breed(
      id: 'abys',
      name: 'Abyssinian',
      description: 'The Abyssinian is a breed of domestic cat.',
      temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
      origin: 'Egypt',
      lifeSpan: '14 - 15 years',
      adaptability: 5,
      affectionLevel: 5,
      childFriendly: 4,
      dogFriendly: 4,
      healthIssues: 2,
      intelligence: 5,
      socialNeeds: 4,
      strangerFriendly: 3,
      grooming: 2,
      energyLevel: 5,
      weight: WeightBreed(imperial: '8 - 10', metric: '4 - 5'),
      image: ImageBreed(
        height: 200,
        id: '1',
        width: 200,
        url: 'https://cdn2.thecatapi.com/images/1.jpg',
      ),
    );
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en')],
        home: Scaffold(body: CatBreedsList(breeds: [breed], cardHeight: 100)),
      ),
    );

    //Act
    final breedFinder = find.text('Abyssinian');

    // Assert
    expect(breedFinder, findsOneWidget);
  });
}
