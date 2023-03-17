/// General error for app
abstract class GeneralError implements Exception {}

/// Unknown error
class GeneralUnknownError extends GeneralError with UnknownError {
  @override
  final Object error;

  @override
  final StackTrace stackTrace;

  /// Main constructor
  GeneralUnknownError(
    this.error,
    this.stackTrace,
  );
}

/// Unknown error
abstract class UnknownError {
  /// Error
  abstract final Object error;

  /// StackTrace
  abstract final StackTrace stackTrace;
}
