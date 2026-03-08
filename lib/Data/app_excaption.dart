class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix, $_message";
  }
}

class FeatchDataException extends AppException {
  FeatchDataException(String message)
    : super(message, 'Error occur during communication with network: ');
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message, 'Invalid Request: ');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(String message) : super(message, 'UnAuthorized:');
}

class InvalidInputExcaption extends AppException {
  InvalidInputExcaption(String message) : super(message, 'Invalid Input:');
}
