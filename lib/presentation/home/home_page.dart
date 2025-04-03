import 'package:catpedia/presentation/shared/shared.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
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

                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      hintText: 'Search for a cat breed',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
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
              color: Theme.of(context).colorScheme.onPrimary,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.2,
                      ),
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
                          child: Image.network(
                            'https://cdn2.thecatapi.com/images/ozEvzdVM-.jpg',
                            height: 210,
                            width: 200,
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: ShimmerEffect(
                                  child: Container(
                                    height: 210,
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
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ChipText(text: "Razaaaa", title: "Raza"),
                                const SizedBox(height: 5),
                                ChipText(
                                  text: "Colombia",
                                  title: "Pais de origen",
                                ),
                                const SizedBox(height: 5),
                                ChipText(
                                  text: "Razaaaa",
                                  title: "Inteligencia",
                                ),
                                const SizedBox(height: 5),

                                ChipText(
                                  text: "Razaaaa",
                                  title: "Inteligencia",
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
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
