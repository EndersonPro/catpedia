import 'package:catpedia/presentation/home/widgets/cat_breeds_listview.dart';
import 'package:catpedia/presentation/home/widgets/search_input.dart';
import 'package:catpedia/presentation/shared/shared.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    // final state = context.read<HomeBloc>().state;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsManager.imagesIconsCatPediaIcon,
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'CatPedia',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  SearchInput(),
                ],
              ),
            ),
            centerTitle: true,
            toolbarHeight: height * .2,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: height * .8,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).colorScheme.onPrimary,
              child: CatBreedsListView(),
            ),
          ),
        ],
      ),
    );
  }
}
