/// General error for app
class GeneralError implements Exception {
  /// Error
  final Object error;

  /// StackTrace
  final StackTrace stackTrace;

  /// Main constructor
  GeneralError(
    this.error,
    this.stackTrace,
  );
}
