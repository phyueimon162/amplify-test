import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict(String reason) = Conflict;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error, int? statusCode) =
      DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static Future<NetworkExceptions> handleResponse(Response? response) async {
    return NetworkExceptions.defaultError(
        response!.statusMessage ?? "Unexpected error occurred.",
        response.statusCode);
  }

  static Future<NetworkExceptions> getDioException(error) async {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return const NetworkExceptions.requestCancelled();
            case DioExceptionType.connectionTimeout:
              return const NetworkExceptions.requestTimeout();
            case DioExceptionType.unknown:
              return const NetworkExceptions.unexpectedError();
            case DioExceptionType.receiveTimeout:
              return const NetworkExceptions.requestTimeout();
            case DioExceptionType.badResponse:
              return await NetworkExceptions.handleResponse(error.response);
            case DioExceptionType.sendTimeout:
              return const NetworkExceptions.sendTimeout();
            case DioExceptionType.badCertificate:
              return const NetworkExceptions.unexpectedError();
            case DioExceptionType.connectionError:
              return const NetworkExceptions.serviceUnavailable();
          }
        } else if (error is SocketException) {
          return const NetworkExceptions.noInternetConnection();
        } else {
          return const NetworkExceptions.unexpectedError();
        }
      } on FormatException {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static bool isConflict(NetworkExceptions networkExceptions) {
    networkExceptions.whenOrNull(conflict: (String msg) {
      return true;
    });
    return false;
  }

  static String getErrorMessage(NetworkExceptions networkExceptions,
      {bool isCreateAccount = false}) {
    var errorMessage = "";
    networkExceptions.when(requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: (String error) {
      errorMessage = error;
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error, int? statusCode) {
      if (isCreateAccount && [1001, 1005, 1007].any((e) => e == statusCode)) {
        errorMessage = statusCode.toString();
      } else {
        errorMessage = error;
      }
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    });
    return errorMessage;
  }
}
