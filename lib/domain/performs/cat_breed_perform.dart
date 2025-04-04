import 'package:catpedia/domain/entities/breed.dart';

abstract class CatBreedPerform {
  Future<List<Breed>> getBreeds({int? limit = 10, int? page = 0});
  Future<List<Breed>> searchBreeds(String query);
}
