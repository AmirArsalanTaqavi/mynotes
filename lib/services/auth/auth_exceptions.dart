import 'package:firebase_auth/firebase_auth.dart';
// login exceptions

class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

// register exceptions

class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// generic exceptions

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}

class UserDisabledAuthException implements Exception {}

class TooManyRequestsAuthException implements Exception {}

class OperationNotAllowedAuthException implements Exception {}

// Exceptions
void handleAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      throw EmailAlreadyInUseAuthException();

    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      throw WrongPasswordAuthException();

    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      throw UserNotFoundAuthException();

    case "ERROR_USER_DISABLED":
    case "user-disabled":
      throw UserDisabledAuthException();

    case "ERROR_TOO_MANY_REQUESTS":
      throw TooManyRequestsAuthException();

    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      throw OperationNotAllowedAuthException();

    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      throw InvalidEmailAuthException();

    default:
      throw GenericAuthException();
  }
}
