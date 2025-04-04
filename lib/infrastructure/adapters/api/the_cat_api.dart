import 'package:catpedia/domain/domain.dart';
import 'package:catpedia/infrastructure/adapters/mappers/cat_breeds/breed_dto.dart';
import 'package:catpedia/infrastructure/adapters/mappers/dto_to_entity.dart';
import 'package:catpedia/infrastructure/interfaces/http_client/http_client.dart';

enum FetchTheCatError { notFound, serverError, unknown }

class FetchTheCatException implements Exception {
  final FetchTheCatError error;
  final String message;

  FetchTheCatException(this.error, this.message);

  @override
  String toString() => 'FetchTheCatException: $message';
}

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

    if (result.statusCode == 200) {
      return response ?? [];
    }

    switch (result.statusCode) {
      case 404:
        throw FetchTheCatException(
          FetchTheCatError.notFound,
          'Breeds not found',
        );
      case 500:
        throw FetchTheCatException(
          FetchTheCatError.serverError,
          'Server error',
        );
      default:
        throw FetchTheCatException(
          FetchTheCatError.unknown,
          'Unknown error occurred',
        );
    }
  }

  @override
  Future<List<Breed>> searchBreeds(String query) async {
    final result = await _httpClient.get<List>(
      '/breeds/search',
      queryParameters: {'q': query},
    );
    final response =
        result.body
            ?.map((rawBreed) => dtoToEntityBreed(BreedDto.fromJson(rawBreed)))
            .toList();
    if (result.statusCode == 200) {
      return response ?? [];
    }

    switch (result.statusCode) {
      case 404:
        throw FetchTheCatException(
          FetchTheCatError.notFound,
          'Breeds not found',
        );
      case 500:
        throw FetchTheCatException(
          FetchTheCatError.serverError,
          'Server error',
        );
      default:
        throw FetchTheCatException(
          FetchTheCatError.unknown,
          'Unknown error occurred',
        );
    }
  }
}
