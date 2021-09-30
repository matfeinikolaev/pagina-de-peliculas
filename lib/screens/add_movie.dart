import 'package:flutter/material.dart';
import 'package:pagina_de_peliculas/widgets/add_movie_form.dart';

class AddMovie extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _genreFocusNode = FocusNode();
  final FocusNode _yearFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _genreFocusNode.unfocus();
        _yearFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddMovieForm(
              titleFocusNode: _titleFocusNode,
              genreFocusNode: _genreFocusNode,
              yearFocusNode: _yearFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
