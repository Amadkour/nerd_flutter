class MyValidation {
  static MyValidation instance = MyValidation._init();
  MyValidation._init();
  String? nameValidate(String? input) {
    ///correct pattern
    if ((input?.toUpperCase().startsWith("A") ?? false) && (input?.length ?? 0) > 4) {
      return null;
    }

    ///incorrect pattern
    return "invalid name";
  }
}
