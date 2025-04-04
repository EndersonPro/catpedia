import 'package:catpedia/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mock.dart';

void main() {
  group('SearchCatBreedUseCase Test', () {
    test('should return a result search of cat breeds', () async {
      // Arrange
      final repository = TheCatApiMock();
      final searchCatBreedUseCase = SearchCatBreedUseCase(
        breedPerform: repository,
      );
      const expectedLength = 1;
      const expectedId = 'acur';
      const expectedIntelligence = 5;
      const expectedName = 'American Curl';

      // Act
      final result = await searchCatBreedUseCase('acur');

      // Assert
      expect(result, isA<List<Breed>>());
      expect(result.length, expectedLength);
      expect(result[0].id, expectedId);
      expect(result[0].intelligence, expectedIntelligence);
      expect(result[0].name, expectedName);
    });
  });
}
