import '../entities/breed.dart';

abstract class TheCatRepositoryInterface {
  Future<List<Breed>> getBreeds({int? limit, int? page});

  Future<Breed> getBreed(String breedId);

  Future<List<Breed>> searchBreeds(String query);
}
