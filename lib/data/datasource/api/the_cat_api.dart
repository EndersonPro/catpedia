import 'package:catpedia/data/models/breed.dart';
import 'package:catpedia/domain/domain.dart';
import 'package:catpedia/domain/entities/breed.dart';

class TheCatApiImpl implements TheCatApiInterface {
  final HttpClientInterface _httpClient;

  TheCatApiImpl({required HttpClientInterface httpClient})
    : _httpClient = httpClient;

  @override
  Future<Breed> getBreed(String breedId) {
    // TODO: implement getBreed
    throw UnimplementedError();
  }

  @override
  Future<List<BreedModel>> getBreeds({int? limit = 10, int? page = 0}) async {
    final result = await _httpClient.get<List>(
      '/breeds',
      queryParameters: {'limit': limit, 'page': page},
    );
    final body = result.body;
    final response =
        body?.map((rawBreed) => BreedModel.fromJson(rawBreed)).toList();
    return response ?? [];
  }

  @override
  Future<List<Breed>> searchBreeds(String query) {
    // TODO: implement searchBreeds
    throw UnimplementedError();
  }
}
