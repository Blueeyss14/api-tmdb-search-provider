import 'package:api_search_func/home/home.dart';
import 'package:api_search_func/providers/movie_isClicked.dart';
import 'package:api_search_func/providers/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MovieIsclicked()),
          ChangeNotifierProvider(create: (context) => SearchFn()),

        ],
    child: MyApp(),
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
