class MyValidation {
  static MyValidation instance = MyValidation._init();
  MyValidation._init();
  final RegExp mailPattern = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  final RegExp passPattern = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

  String? mainValidate(String? input) {
    ///correct pattern
    if (mailPattern.hasMatch(input ?? '')) {
      return null;
    }

    ///incorrect pattern
    return "invalid mail";
  }

  String? passValidate(String? input) {
    ///correct pattern
    if (passPattern.hasMatch(input ?? '')) {
      return null;
    }

    ///incorrect pattern
    return "password must be eight characters, at least one letter, one number and one special character";
  }
}
