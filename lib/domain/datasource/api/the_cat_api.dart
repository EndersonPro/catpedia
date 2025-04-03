import 'package:catpedia/domain/entities/breed.dart';

abstract class TheCatApiInterface {
  Future<List<Breed>> getBreeds({int? limit = 10, int? page = 0});
  Future<Breed> getBreed(String breedId);
  Future<List<Breed>> searchBreeds(String query);
}
