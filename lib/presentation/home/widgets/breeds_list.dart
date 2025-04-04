import 'package:catpedia/core/router.dart';
import 'package:catpedia/domain/entities/breed.dart';
import 'package:catpedia/presentation/home/bloc/home_bloc.dart';
import 'package:catpedia/presentation/home/widget_keys/home_keys.dart';
import 'package:catpedia/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CatBreedsList extends StatefulWidget {
  const CatBreedsList({
    super.key,
    required this.breeds,
    required this.cardHeight,
  });

  final List<Breed> breeds;
  final double cardHeight;

  @override
  State<CatBreedsList> createState() => _CatBreedsListState();
}

class _CatBreedsListState extends State<CatBreedsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<HomeBloc>().add(LoadMoreEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return ListView.builder(
      key: HomePageKeys.resultListView,
      controller: _scrollController,
      itemCount: widget.breeds.length,
      itemBuilder: (context, index) {
        final breed = widget.breeds[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              CatPediaRoutes.catDetails,
              arguments: breed,
            );
          },
          child: Card(
            key: Key(breed.id.toString()),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: CatPediaColors.lightGrey, width: 1.2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                  child:
                      (() {
                        final imageUrl = breed.image?.url;
                        if (imageUrl != null) {
                          return Hero(
                            tag: breed.id.toString(),
                            child: Image.network(
                              breed.image!.url,
                              height: widget.cardHeight,
                              width: 200,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              loadingBuilder: (
                                context,
                                child,
                                loadingProgress,
                              ) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: ShimmerEffect(
                                    child: Container(
                                      height: widget.cardHeight,
                                      width: 200,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 210,
                                  width: 200,
                                  color: Colors.grey.shade300,
                                  child: Image.asset(
                                    AssetsManager.imagesIconsCatPediaIcon,
                                    height: 40,
                                    width: 40,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return Container(
                          height: 210,
                          width: 200,
                          color: Colors.grey.shade300,
                          child: Image.asset(
                            AssetsManager.imagesIconsCatPediaIcon,
                            height: 40,
                            width: 40,
                          ),
                        );
                      })(),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ChipText(text: breed.name ?? '', title: l10n.breed),
                        const SizedBox(height: 5),
                        ChipText(text: breed.origin ?? '', title: l10n.country),
                        const SizedBox(height: 5),
                        ChipText(
                          text: breed.intelligence?.toString() ?? '',
                          title: l10n.intelligence,
                        ),
                        const SizedBox(height: 5),

                        ChipText(
                          text: breed.temperament ?? '',
                          title: l10n.temperament,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              l10n.moreInformation,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
