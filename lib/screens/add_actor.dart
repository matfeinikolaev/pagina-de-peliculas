import 'package:flutter/material.dart';
import 'package:pagina_de_peliculas/widgets/add_actor_form.dart';

class AddActor extends StatelessWidget {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _sexFocusNode = FocusNode();
  final FocusNode _movieFocusNode = FocusNode();

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
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddActorForm(
              nameFocusNode: _nameFocusNode,
              sexFocusNode: _sexFocusNode,
              movieFocusNode: _movieFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
