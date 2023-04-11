abstract class NetworkResult {}

class NetworkResultNone extends NetworkResult {}

class NetworkResultLoading extends NetworkResult {}

class NetworkResultSuccess extends NetworkResult {
  final Object data;
  NetworkResultSuccess({required this.data});
}

class NetworkResultError extends NetworkResult {
  final Exception e;
  NetworkResultError({required this.e});
}
