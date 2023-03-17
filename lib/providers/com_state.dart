import '/utils/general_error.dart';

/// The communication state
class ComState {
  final GeneralError? _error;

  /// The status
  final ComStatus status;

  /// Constructor for idle state
  const ComState.idle()
      : status = ComStatus.idle,
        _error = null;

  /// Constructor for loading state
  ComState.loading()
      : status = ComStatus.loading,
        _error = null;

  /// Constructor for end success state
  ComState.endSuccess()
      : status = ComStatus.endSuccess,
        _error = null;

  /// Constructor for error state by [error]
  ComState.error(GeneralError error)
      : status = ComStatus.error,
        _error = error;

  /// Constructor for error state for unknown error, by [e] and [s]
  ComState.unknownError(Object e, StackTrace s)
      : status = ComStatus.error,
        _error = GeneralUnknownError(e, s);

  /// Returns the error
  GeneralError? get error {
    return _error;
  }

  /// Return if has error
  bool get hasError {
    return status == ComStatus.error;
  }

  /// Return if is success
  bool get isSuccess {
    return status == ComStatus.endSuccess;
  }

  /// Return if is loading
  bool get isLoading {
    return status == ComStatus.loading;
  }

  /// Return if is iddle
  bool get isIdle {
    return status == ComStatus.idle;
  }

  /// Return a list of [T] that have [status]
  static List<T> getAllWithStatus<T>(Map<T, ComState> map, ComStatus status) {
    List<T> result = [];
    for (final entry in map.entries) {
      if (entry.value.status == status) {
        result.add(entry.key);
      }
    }
    return result;
  }

  /// Return a list of [T] that status is loading
  static List<T> getAllLoading<T>(Map<T, ComState> map) {
    return getAllWithStatus(map, ComStatus.loading);
  }

  @override

  /// Operator ==
  bool operator ==(Object other) {
    if (other is! ComState) return false;
    return other.status == status;
  }

  @override

  /// Hashcode
  int get hashCode => status.hashCode;
}

/// Communication Status
enum ComStatus {
  /// When communication not starts
  idle,

  /// When communication is starts and not ended
  loading,

  /// When communication is ends successfully
  endSuccess,

  /// When communication is ends with error
  error
}
