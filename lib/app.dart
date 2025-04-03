import 'package:catpedia/data/di.dart';
import 'package:catpedia/domain/repositories/the_cat_repository.dart';
import 'package:flutter/material.dart';

class CatPediaApp extends StatelessWidget {
  const CatPediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: getIt<TheCatRepositoryInterface>().getBreeds(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Text('Data: ${snapshot.data}');
              } else {
                return const Text('No data');
              }
            },
          ),
        ),
      ),
    );
  }
}
