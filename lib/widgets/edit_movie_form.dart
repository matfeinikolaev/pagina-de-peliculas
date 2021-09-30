import 'package:flutter/material.dart';

import 'package:pagina_de_peliculas/utils/database.dart';
import 'package:pagina_de_peliculas/utils/validator.dart';

import 'custom_form_field.dart';

class EditMovieForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode genreFocusNode;
  final FocusNode yearFocusNode;
  final String currentTitle;
  final String currentGenre;
  final String currentYear;
  final String documentId;

  const EditMovieForm({
    required this.titleFocusNode,
    required this.genreFocusNode,
    required this.yearFocusNode,
    required this.currentTitle,
    required this.currentGenre,
    required this.currentYear,
    required this.documentId,
  });

  @override
  _EditMovieFormState createState() => _EditMovieFormState();
}

class _EditMovieFormState extends State<EditMovieForm> {
  final _editMovieFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  late TextEditingController _titleController;
  late TextEditingController _genreController;
  late TextEditingController _yearController;

  @override
  void initState() {
    _titleController = TextEditingController(
      text: widget.currentTitle,
    );

    _genreController = TextEditingController(
      text: widget.currentGenre,
    );

    _yearController = TextEditingController(
      text: widget.currentYear,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editMovieFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),
                Text(
                  'Titulo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _titleController,
                  focusNode: widget.titleFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Title',
                  hint: 'Enter your note title',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Genero',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _genreController,
                  focusNode: widget.genreFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Genero',
                  hint: 'Enter your note genero',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Año',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _yearController,
                  focusNode: widget.yearFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Año',
                  hint: 'Enter your note año',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.indigoAccent,
                    ),
                  ),
                )
              : Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.indigoAccent,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      widget.titleFocusNode.unfocus();
                      widget.genreFocusNode.unfocus();
                      widget.yearFocusNode.unfocus();

                      if (_editMovieFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateMovie(
                          docId: widget.documentId,
                          title: _titleController.text,
                          genre: _genreController.text,
                          year: _yearController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'guardar la pelicula',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
