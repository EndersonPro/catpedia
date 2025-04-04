import 'package:catpedia/domain/domain.dart';
import 'package:catpedia/infrastructure/adapters/mappers/cat_beerds/breed_dto.dart';
import 'package:catpedia/infrastructure/adapters/mappers/dto_to_entity.dart';
import 'package:catpedia/infrastructure/interfaces/http_client/http_client.dart';

class TheCatApi extends CatBreedPerform {
  final HttpClientInterface _httpClient;

  TheCatApi({required HttpClientInterface httpClient})
    : _httpClient = httpClient;

  @override
  Future<List<Breed>> getBreeds({int? limit = 10, int? page = 0}) async {
    final result = await _httpClient.get<List>(
      '/breeds',
      queryParameters: {'limit': limit, 'page': page},
    );
    final response =
        result.body
            ?.map((rawBreed) => dtoToEntityBreed(BreedDto.fromJson(rawBreed)))
            .toList();
    return response ?? [];
  }

  @override
  Future<List<Breed>> searchBreeds(String query) {
    // TODO: implement searchBreeds
    throw UnimplementedError();
  }
}
