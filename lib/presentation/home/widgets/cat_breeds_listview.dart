import 'package:catpedia/presentation/home/bloc/home_bloc.dart';
import 'package:catpedia/presentation/home/widgets/breeds_list.dart';
import 'package:catpedia/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBreedsListView extends StatelessWidget {
  const CatBreedsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cardHeight = 210.0;
    final homeState = context.watch<HomeBloc>().state;

    if (homeState.hasError) {
      return Center(
        child: Text(
          'Error loading breeds',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      );
    }

    if (homeState.isLoading) {
      return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ShimmerEffect(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(color: CatPediaColors.lightGrey, width: 1.2),
              ),
              child: Container(height: cardHeight),
            ),
          );
        },
      );
    }

    return CatBreedsList(breeds: homeState.breeds, cardHeight: cardHeight);
  }
}
