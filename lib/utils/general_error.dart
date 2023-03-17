import '../intl/app_localizations_delegate.dart';

/// General error for app
abstract class GeneralError implements Exception {
  /// Returns message to show user
  String? getUserMessage(AppLocalizationsData localizationsData) => null;
}

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

  @override
  String? getUserMessage(AppLocalizationsData localizationsData) {
    return localizationsData.unknownError;
  }
}

/// Unknown error
abstract class UnknownError {
  /// Error
  abstract final Object error;

  /// StackTrace
  abstract final StackTrace stackTrace;
}
