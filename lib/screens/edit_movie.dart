import 'package:flutter/material.dart';
import 'package:pagina_de_peliculas/utils/database.dart';
import 'package:pagina_de_peliculas/widgets/edit_movie_form.dart';

class EditMovie extends StatefulWidget {
  final String currentTitle;
  final String currentGenre;
  final String currentYear;
  final String documentId;

  EditMovie({
    required this.currentTitle,
    required this.currentGenre,
    required this.currentYear,
    required this.documentId,
  });

  @override
  _EditMovieState createState() => _EditMovieState();
}

class _EditMovieState extends State<EditMovie> {
  final FocusNode _titleFocusNode = FocusNode();

  final FocusNode _genreFocusNode = FocusNode();

  final FocusNode _yearFocusNode = FocusNode();

  bool _isDeleting = false;

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
          actions: [
            _isDeleting
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.red,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteMovie(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditMovieForm(
              documentId: widget.documentId,
              titleFocusNode: _titleFocusNode,
              genreFocusNode: _genreFocusNode,
              yearFocusNode: _yearFocusNode,
              currentTitle: widget.currentTitle,
              currentGenre: widget.currentGenre,
              currentYear: widget.currentYear,
            ),
          ),
        ),
      ),
    );
  }
}
