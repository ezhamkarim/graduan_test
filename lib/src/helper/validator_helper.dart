class ValidatorHelper {
  static String? generalValidator(String? str) {
    if (str == null || str.isEmpty) {
      return 'Empty';
    }
    return null;
  }
}
