class InternetException implements Exception {
  String message;
  InternetException({required this.message});
}

class ApiException implements Exception {
  String message;
  ApiException({required this.message});
}

class CashException implements Exception {
  String message;
  CashException({required this.message});
}

class AuthException implements Exception {
  String message;
  AuthException({required this.message});
}

class UpdateUserException implements Exception {
  String message;
  UpdateUserException({required this.message});
}
