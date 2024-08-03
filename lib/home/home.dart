import 'package:api_search_func/providers/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/save_movie.dart';
import '../providers/movie_isClicked.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final movieIsCLicked = Provider.of<MovieIsclicked>(context);
    final searchProvider = Provider.of<SearchFn>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: (movieIsCLicked.currentIndex == 0 ? const Text("Home")
            : movieIsCLicked.currentIndex == 1
            ? TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search...",
          ),
          controller: searchProvider.searchController,
          onChanged: (value) {
            searchProvider.searchMovieFn(value); // Auto-complete
          },
          onSubmitted: (value) {
            searchProvider.onSearchSubmitted(); // Mark search as done
          },
        )
            : const Text("Favorite")),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: movieIsCLicked.currentIndex == 1
          ? SaveMovie()
          : movieIsCLicked.movie_widget[movieIsCLicked.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: movieIsCLicked.currentIndex,
        onTap: (index) {
          movieIsCLicked.setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search,), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: "Favorites"),
        ],
      ),
    );
  }
}
