class ServerException implements Exception {
  const ServerException(this.message);
  final String message;
}

class NetworkException implements Exception {
  const NetworkException([this.message = 'Network connection failed']);
  final String message;
}
