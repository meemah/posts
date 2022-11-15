// ignore_for_file: prefer_typing_uninitialized_variables

class AppException implements Exception {
  final message;
  final prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return "$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message = ""])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message])
      : super(
          message,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message])
      : super(
          message,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException([String message = ""])
      : super(
          message,
        );
}
