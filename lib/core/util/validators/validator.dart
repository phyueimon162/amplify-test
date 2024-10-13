class Validator {
  static String? emailValidator(String? value) {
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value != null && value.isEmpty) {
      return '* required';
    } else if (value != null && !emailRegExp.hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  static String? nullCheckValidator(String? value) {
    if (value != null && value.isEmpty) {
      return '* required';
    }
    return null;
  }
}
