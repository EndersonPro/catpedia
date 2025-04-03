import 'package:catpedia/domain/domain.dart';
import 'package:catpedia/domain/entities/breed.dart';

class TheCatRepositoryImpl implements TheCatRepositoryInterface {
  final TheCatApiInterface _theCatApi;
  final LoggerInterface _logger;

  TheCatRepositoryImpl({
    required TheCatApiInterface api,
    required LoggerInterface logger,
  }) : _logger = logger,
       _theCatApi = api;

  @override
  Future<Breed> getBreed(String breedId) {
    // TODO: implement getBreed
    throw UnimplementedError();
  }

  @override
  Future<List<Breed>> getBreeds({int? limit = 10, int? page = 0}) async {
    try {
      _logger.info('Fetching breeds with limit: $limit and page: $page');
      final breeds = await _theCatApi.getBreeds(limit: limit, page: page);
      return breeds;
    } catch (e, stackTrace) {
      _logger.error(e.toString(), stackTrace);
      return [];
    }
  }

  @override
  Future<List<Breed>> searchBreeds(String query) {
    // TODO: implement searchBreeds
    throw UnimplementedError();
  }
}
