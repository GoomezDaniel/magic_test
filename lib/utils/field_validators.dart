/// Validators of fields
class FieldValidators {
  /// Returns if [name] is valid
  static bool isNameValid(String name) {
    if (name.isEmpty) {
      return false;
    } else {
      return RegExp(r'([A-Za-zÀ-ÖØ-öø-ÿ\r]*$)').hasMatch(name);
    }
  }

  /// Returns if [email] is valid
  static bool isEmailValid(String? email) {
    if (email == null) return false;
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
