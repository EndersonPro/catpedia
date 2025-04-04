import 'package:catpedia/domain/entities/breed.dart';
import 'package:catpedia/presentation/home/bloc/home_bloc.dart';
import 'package:catpedia/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.breeds.length,
      itemBuilder: (context, index) {
        final breed = widget.breeds[index];
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: CatPediaColors.lightGrey, width: 1.2),
          ),
          // color: Theme.of(context).colorScheme.secondary,
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
                        return Image.network(
                          breed.image!.url,
                          height: widget.cardHeight,
                          width: 200,
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
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
                      ChipText(text: breed.name ?? '', title: "Raza"),
                      const SizedBox(height: 5),
                      ChipText(
                        text: breed.origin ?? '',
                        title: "Pais de origen",
                      ),
                      const SizedBox(height: 5),
                      ChipText(
                        text: breed.intelligence?.toString() ?? '',
                        title: "Inteligencia",
                      ),
                      const SizedBox(height: 5),

                      ChipText(
                        text: breed.temperament ?? '',
                        title: "Temperamento",
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Saber más",
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
        );
      },
    );
  }
}
