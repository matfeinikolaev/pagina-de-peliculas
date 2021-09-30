class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return 'Este campo no puede estar vacío';
    }

    return null;
  }
}
