import 'package:api_search_func/Api/models/movie.dart';
import 'package:api_search_func/Routes/item_clicked.dart';
import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Future<List<Movie>> _movie = Movie.dataMovie();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: _movie, builder: (context, dynamic snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyItem(itemClicked: snapshot.data[index]),
                ));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:  NetworkImage(
                      'https://image.tmdb.org/t/p/w500${snapshot.data[index].thumbnail}'),
                ),
                title: Text('${snapshot.data[index].title}'),
                subtitle: Text('${snapshot.data[index].overview}', style: TextStyle(overflow: TextOverflow.ellipsis),),
              ),
            );
          });
        } else {
          return Text("");
        }
      },),
    );
  }
}
