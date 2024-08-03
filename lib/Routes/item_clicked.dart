import 'package:flutter/material.dart';

class MyItem extends StatefulWidget {
  final itemClicked;
  const MyItem({super.key, required this.itemClicked});

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(

        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500${widget.itemClicked.thumbnail}'),
              fit: BoxFit.cover),
        ),
    ),
    );
  }
}
