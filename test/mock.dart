import 'package:catpedia/domain/domain.dart';

class TheCatApiMock extends CatBreedPerform {
  @override
  Future<List<Breed>> getBreeds({int? limit = 10, int? page = 0}) {
    return Future.value([
      Breed(
        id: 'abys',
        name: 'Abyssinian',
        description: 'The Abyssinian is a breed of domestic cat.',
        temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
        origin: 'Egypt',
        lifeSpan: '14 - 15 years',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 4,
        dogFriendly: 4,
        healthIssues: 2,
        intelligence: 5,
        socialNeeds: 4,
        strangerFriendly: 3,
        grooming: 2,
        energyLevel: 5,
        weight: WeightBreed(imperial: '8 - 10', metric: '4 - 5'),
        image: ImageBreed(
          height: 200,
          id: '1',
          width: 200,
          url: 'https://cdn2.thecatapi.com/images/1.jpg',
        ),
      ),
    ]);
  }

  @override
  Future<List<Breed>> searchBreeds(String query) {
    return Future.value([
      Breed(
        id: 'acur',
        name: 'American Curl',
        description: 'The Abyssinian is a breed of domestic cat.',
        temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
        origin: 'United States',
        lifeSpan: '14 - 15 years',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 4,
        dogFriendly: 4,
        healthIssues: 2,
        intelligence: 5,
        socialNeeds: 4,
        strangerFriendly: 3,
        grooming: 2,
        energyLevel: 5,
        weight: WeightBreed(imperial: '8 - 10', metric: '4 - 5'),
        image: ImageBreed(
          height: 200,
          id: '1',
          width: 200,
          url: 'https://cdn2.thecatapi.com/images/1.jpg',
        ),
      ),
    ]);
  }
}
