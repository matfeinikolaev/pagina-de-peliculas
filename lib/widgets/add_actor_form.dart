import 'package:flutter/material.dart';
import 'package:pagina_de_peliculas/utils/database.dart';
import 'package:pagina_de_peliculas/utils/validator.dart';

import 'custom_form_field.dart';

class AddActorForm extends StatefulWidget {
  final FocusNode nameFocusNode;
  final FocusNode sexFocusNode;
  final FocusNode movieFocusNode;

  const AddActorForm({
    required this.nameFocusNode,
    required this.sexFocusNode,
    required this.movieFocusNode,
  });

  @override
  _AddActorFormState createState() => _AddActorFormState();
}

class _AddActorFormState extends State<AddActorForm> {
  final _addActorFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _movieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addActorFormKey,
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
                  'Nombre',
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
                  controller: _nameController,
                  focusNode: widget.nameFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Nombre',
                  hint: 'nombre del actor',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Sexo',
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
                  controller: _sexController,
                  focusNode: widget.sexFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Sexo',
                  hint: 'el sexo del actor',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Pelicula',
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
                  controller: _movieController,
                  focusNode: widget.movieFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Pelicula',
                  hint: 'la pelicula del actor',
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
                      widget.nameFocusNode.unfocus();
                      widget.sexFocusNode.unfocus();
                      widget.movieFocusNode.unfocus();

                      if (_addActorFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addActor(
                          name: _nameController.text,
                          sex: _sexController.text,
                          movie: _movieController.text,
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
                        'Añadir actor',
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
