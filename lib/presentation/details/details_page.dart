import 'package:catpedia/domain/entities/breed.dart';
import 'package:catpedia/presentation/shared/assets/assets_manager.dart';
import 'package:catpedia/presentation/shared/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets_keys/details_page_keys.dart';

class CatBreedDetail extends StatelessWidget {
  const CatBreedDetail({super.key, required this.breed});
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                  key: DetailsPageWidgetKeys.image,
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
                      key: DetailsPageWidgetKeys.breed,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      breed.description ?? l10n.noDescriptionAvailable,
                      key: DetailsPageWidgetKeys.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${l10n.temperament}: ${breed.temperament}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${l10n.country}: ${breed.origin}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${l10n.lifeSpan}: ${breed.lifeSpan}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${l10n.weight}: ${breed.weight?.metric} kg',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${l10n.intelligence}: ${breed.intelligence}',
                      key: DetailsPageWidgetKeys.intelligence,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${l10n.affectionLevel}: ${breed.affectionLevel}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${l10n.grooming}: ${breed.grooming}',
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
