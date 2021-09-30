import 'package:flutter/material.dart';
import 'package:pagina_de_peliculas/widgets/genre_display_list.dart';

class GenreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: GenreDisplayList()
          ),
        ),
      ),
    );
  }
}
