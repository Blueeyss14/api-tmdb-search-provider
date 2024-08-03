import 'package:api_search_func/Api/models/movie.dart';
import 'package:api_search_func/providers/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaveMovie extends StatelessWidget {
  const SaveMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchFn>(context);

    return Scaffold(
      body: Consumer<SearchFn>(
        builder: (context, searchProvider, child) {
          if (!searchProvider.isSearchDone) {
            return Center(
              child: Text("Please enter a search query"),
            );
          }
          if (searchProvider.filteredMovies.isEmpty) {
            return Center(
              child: Text("No results found"),
            );
          }
          return ListView.builder(
            itemCount: searchProvider.filteredMovies.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchProvider.filteredMovies[index].title),
              );
            },
          );
        },
      ),
    );
  }
}