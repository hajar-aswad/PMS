enum StatusView {
  none,
  loading,
  noContent,
  serverFailure,
}

abstract class StatusCodeRequest {
  static const int ok = 200;
  static const int badRequest = 400;
  static const int unauthorised = 401;
}

enum SnackBarType {
  info,
  error,
  warning,
}
