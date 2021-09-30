import 'package:flutter/material.dart';
import 'package:pagina_de_peliculas/utils/database.dart';
import 'package:pagina_de_peliculas/widgets/edit_actor_form.dart';

class EditActor extends StatefulWidget {
  final String currentName;
  final String currentMovie;
  final String currentSex;
  final String documentId;

  EditActor({
    required this.currentName,
    required this.currentSex,
    required this.currentMovie,
    required this.documentId,
  });

  @override
  _EditActorState createState() => _EditActorState();
}

class _EditActorState extends State<EditActor> {
  final FocusNode _nameFocusNode = FocusNode();

  final FocusNode _sexFocusNode = FocusNode();

  final FocusNode _movieFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _nameFocusNode.unfocus();
        _sexFocusNode.unfocus();
        _movieFocusNode.unfocus();
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

                      await Database.deleteActor(
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
            child: EditActorForm(
              documentId: widget.documentId,
              nameFocusNode: _nameFocusNode,
              sexFocusNode: _sexFocusNode,
              movieFocusNode: _movieFocusNode,
              currentName: widget.currentName,
              currentSex: widget.currentSex,
              currentMovie: widget.currentMovie,
            ),
          ),
        ),
      ),
    );
  }
}
