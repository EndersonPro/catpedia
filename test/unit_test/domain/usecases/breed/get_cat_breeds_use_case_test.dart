import 'package:catpedia/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock.dart';

void main() {
  group('GetCatBreedsUseCase Test', () {
    test('should return a list of cat breeds', () async {
      // Arrange
      final repository = TheCatApiMock();
      final getCatBreedsUseCase = GetCatBreedsUseCase(breedPerform: repository);
      const expectedLength = 1;
      const expectedId = 'abys';
      const expectedIntelligence = 5;
      const expectedName = 'Abyssinian';

      // Act
      final result = await getCatBreedsUseCase();

      // Assert
      expect(result, isA<List<Breed>>());
      expect(result.length, expectedLength);
      expect(result[0].id, expectedId);
      expect(result[0].intelligence, expectedIntelligence);
      expect(result[0].name, expectedName);
    });
  });
}
