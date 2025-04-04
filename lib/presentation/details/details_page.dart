import 'package:catpedia/domain/entities/breed.dart';
import 'package:catpedia/presentation/shared/assets/assets_manager.dart';
import 'package:catpedia/presentation/shared/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class CatBreedDetail extends StatelessWidget {
  const CatBreedDetail({super.key, required this.breed});
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    final imageHeight = 400.0;
    final imageWidth = 400.0;
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(breed.name ?? '-'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: Hero(
                tag: breed.id.toString(),
                child: Image.network(
                  breed.image!.url,
                  height: imageHeight,
                  width: imageWidth,
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: ShimmerEffect(
                        child: Container(
                          height: imageHeight,
                          width: imageWidth,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: imageHeight,
                      width: imageWidth,
                      color: Colors.grey.shade300,
                      child: Image.asset(
                        AssetsManager.imagesIconsCatPediaIcon,
                        height: 40,
                        width: 40,
                      ),
                    );
                  },
                ),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      breed.name ?? '-',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      breed.description ?? 'No description available',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Temperament: ${breed.temperament}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Origin: ${breed.origin}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Life Span: ${breed.lifeSpan}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Weight: ${breed.weight?.metric} kg',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Intelligence: ${breed.intelligence}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Affection Level: ${breed.affectionLevel}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Grooming: ${breed.grooming}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
