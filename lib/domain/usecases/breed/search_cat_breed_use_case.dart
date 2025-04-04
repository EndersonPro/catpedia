import 'package:catpedia/domain/domain.dart';

class SearchCatBreedUseCase {
  final CatBreedPerform _breedPerform;

  SearchCatBreedUseCase({required CatBreedPerform breedPerform})
    : _breedPerform = breedPerform;

  Future<List<Breed>> call(String query) {
    return _breedPerform.searchBreeds(query);
  }
}
