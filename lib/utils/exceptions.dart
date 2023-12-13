class ServerException implements Exception {
  final String errorMessage;
  final num statusCode;

  const ServerException({required this.statusCode, required this.errorMessage});

  @override
  String toString() =>
      'ServerException(statusCode: $statusCode, errorMessage: $errorMessage)';
}

class DioException implements Exception {
  final String message;
  final bool exists;
  const DioException({this.message = '', this.exists = false});
}

class ParsingException implements Exception {
  final String errorMessage;

  const ParsingException({required this.errorMessage});
}
