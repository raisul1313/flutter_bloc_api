import 'dart:async';
import 'dart:io';

abstract class Failure {
  final String? message;

  Failure({this.message});

  static Failure handleExceptionWithMessage(dynamic error) {
    if (error is SocketException) {
      return NetworkFailure(
          networkFailureMessage: "No internet.\n                                            Check your internet connection");
    } else if (error is TimeoutException) {
      return TimeoutFailure(timeoutFailureMessage: "The request timed out");
    } else {
      return GeneralFailure(
          generalFailureMessage: "An error occurred, please try again");
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure({String? networkFailureMessage})
      : super(message: networkFailureMessage);
}

class TimeoutFailure extends Failure {
  TimeoutFailure({String? timeoutFailureMessage})
      : super(message: timeoutFailureMessage);
}

class GeneralFailure extends Failure {
  GeneralFailure({String? generalFailureMessage})
      : super(message: generalFailureMessage);
}
