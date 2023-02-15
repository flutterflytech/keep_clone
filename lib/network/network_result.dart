abstract class NetworkResult<T> {
  NetworkResult._();

  factory NetworkResult.success(T data) = Success<T>;
  factory NetworkResult.failure(Exception exception) = Failure<T>;

  /// Returns true if the parent operation failed to complete.
  bool isFailure() => this is Failure;

  /// Returns the underlying data result. The caller needs to be sure that
  /// this method will only be executed on [Success] instances of this class.
  T get data => (this as Success).data;

  /// Returns the underlying exception. The caller needs to be sure that
  /// this method will only be executed on [Failure] instances of this class.
  Exception get exception => (this as Failure).exception;
}

class Failure<T> extends NetworkResult<T> {
  @override
  final Exception exception;
  Failure(this.exception) : super._();
}

class Success<T> extends NetworkResult<T> {
  @override
  final T data;
  Success(this.data) : super._();
}
