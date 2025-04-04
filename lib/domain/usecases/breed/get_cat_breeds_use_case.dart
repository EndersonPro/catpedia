import 'package:catpedia/domain/domain.dart';

class GetCatBreedsUseCase {
  final BreedPerform _breedPerform;

  GetCatBreedsUseCase({required BreedPerform breedPerform})
    : _breedPerform = breedPerform;

  Future<List<Breed>> call({int? limit = 10, int? page = 0}) {
    return _breedPerform.getBreeds(limit: limit, page: page);
  }
}
