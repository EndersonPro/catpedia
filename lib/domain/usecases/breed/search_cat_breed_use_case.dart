import 'package:catpedia/domain/domain.dart';

class SearchCatBreedUseCase {
  final BreedPerform _breedPerform;

  SearchCatBreedUseCase({required BreedPerform breedPerform})
    : _breedPerform = breedPerform;

  Future<List<Breed>> call(String query) {
    return _breedPerform.searchBreeds(query);
  }
}
