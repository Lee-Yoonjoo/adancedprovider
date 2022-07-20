import 'package:advancedprovider/movieprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/faovirte_item.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innnerBoxIsScrolled) => [
          const SliverAppBar(
            floating: true,
            snap: true,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Favorites',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
        body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Consumer<MovieProvider>(
            builder: (context, provider, index) => provider
                    .favoriteMovies.isNotEmpty
                ? GridView.builder(
                    itemCount: provider.favoriteMovies.length,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: FavoriteItem(provider.favoriteMovies[index]),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                  )
                : const Center(
                    child: Text('No favorites added.'),
                  ),
          ),
        ),
      ),
    );
  }
}
