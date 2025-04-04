import 'package:catpedia/domain/entities/breed.dart';
import 'package:catpedia/domain/entities/image.dart';
import 'package:catpedia/domain/entities/weight.dart';
import 'package:catpedia/infrastructure/adapters/mappers/cat_breeds/breed_dto.dart';
import 'package:catpedia/infrastructure/adapters/mappers/cat_breeds/image_dto.dart';
import 'package:catpedia/infrastructure/adapters/mappers/cat_breeds/weight_dto.dart';

WeightBreed dtoToEntityWeight(WeightDto dto) {
  return WeightBreed(imperial: dto.imperial, metric: dto.metric);
}

ImageBreed dtoToEntityImage(ImageDto dto) {
  return ImageBreed(
    id: dto.id,
    width: dto.width,
    height: dto.height,
    url: dto.url,
  );
}

Breed dtoToEntityBreed(BreedDto dto) {
  return Breed(
    weight: dto.weight != null ? dtoToEntityWeight(dto.weight!) : null,
    id: dto.id,
    name: dto.name,
    cfaUrl: dto.cfaUrl,
    vetstreetUrl: dto.vetstreetUrl,
    vcahospitalsUrl: dto.vcahospitalsUrl,
    temperament: dto.temperament,
    origin: dto.origin,
    countryCodes: dto.countryCodes,
    countryCode: dto.countryCode,
    description: dto.description,
    lifeSpan: dto.lifeSpan,
    indoor: dto.indoor,
    lap: dto.lap,
    altNames: dto.altNames,
    adaptability: dto.adaptability,
    affectionLevel: dto.affectionLevel,
    childFriendly: dto.childFriendly,
    dogFriendly: dto.dogFriendly,
    energyLevel: dto.energyLevel,
    grooming: dto.grooming,
    healthIssues: dto.healthIssues,
    intelligence: dto.intelligence,
    sheddingLevel: dto.sheddingLevel,
    socialNeeds: dto.socialNeeds,
    strangerFriendly: dto.strangerFriendly,
    vocalisation: dto.vocalisation,
    experimental: dto.experimental,
    hairless: dto.hairless,
    natural: dto.natural,
    rare: dto.rare,
    rex: dto.rex,
    suppressedTail: dto.suppressedTail,
    shortLegs: dto.shortLegs,
    wikipediaUrl: dto.wikipediaUrl,
    hypoallergenic: dto.hypoallergenic,
    image: dto.image != null ? dtoToEntityImage(dto.image!) : null,
  );
}
