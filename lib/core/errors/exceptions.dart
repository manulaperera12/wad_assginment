import 'package:dio/dio.dart';

import '../models/dio_response_model.dart';
import '../network/server_error_data.dart';

/// Throws when there's no shared pref data to fetch
class CacheException implements Exception {}

/// Exception for the HTTP requests from Dio
class ServerException implements Exception {
  late String errorMessage;
  late bool unexpectedError;
  ServerErrorData? data;

  ServerException({required this.errorMessage, required this.unexpectedError});

  /// Constructor for Dio package
  ServerException.fromDioError(DioException dioError) {
    data = ServerErrorData.fromDioError(dioError);
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = "Server Request Cancelled";
        unexpectedError = false;
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "Server Connection Timeout";
        unexpectedError = false;
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Server Receive Timeout";
        unexpectedError = false;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Server Send Timeout";
        unexpectedError = false;
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response);
        break;
      case DioExceptionType.unknown:
        if ((dioError.message ?? '').contains('SocketException')) {
          errorMessage = "Server Connection Error";
          unexpectedError = false;
          break;
        }
        errorMessage = "Server Unknown Error";
        unexpectedError = true;
        break;
      default:
        errorMessage = "Server Unknown Error";
        unexpectedError = true;
        break;
    }
  }

  String _handleStatusCode(Response? response) {
    int? statusCode = response?.statusCode;
    switch (statusCode) {
      case 302:
        unexpectedError = true;
        return "An error occurred. Please try again later.";
      case 400:
        unexpectedError = true;
        return "Server Bad Request";
      case 401:
        unexpectedError = false;
        return "Server Unauthorized";
      case 403:
        unexpectedError = false;
        return "Server Unauthorized User";
      case 404:
        unexpectedError = true;
        return "Server Not Found";
      case 405:
        unexpectedError = true;
        return "Server Method Not Allowed";
      case 410:
        unexpectedError = true;
        return "Server not found Mail";
      case 411:
        unexpectedError = true;
        return "An error occurred. Please try again later.";
      case 415:
        unexpectedError = true;
        return "Server Unsupported Media Type";
      case 420:
        unexpectedError = true;
        return "Server Data Validation Failed";
      case 422:
        unexpectedError = false;
        return _getDataValidationErrorMessage(response) ?? "Server Data Validation Failed";
      case 423:
        unexpectedError = true;
        return "An error occurred. Please try again later.";
      case 429:
        unexpectedError = true;
        return "Server Too Many Requests";
      case 500:
        unexpectedError = true;
        return "Server Internal Server Error";
      case 433:
        unexpectedError = true;
        return "An error occurred. Please try again later.";
      case 434:
        unexpectedError = true;
        return "An error occurred. Please try again later.";
      default:
        unexpectedError = true;
        return "Server Unhandled Status Code: $statusCode";
        // return LocaleKeys.errors_server_unhandledStatusCode.tr(args: [statusCode.toString()]);
    }
  }

  /// Generate Validation Errors (Status 422)
  String? _getDataValidationErrorMessage(Response? response) {
    try {
      DioResponseModel res = dioResponseModelFromJson(response?.data);
      // RescheduleBookingModel rescheduleBookingResponse = rescheduleBookingFromJson(response?.data);

      if (res.errors?.businessId != null) {
        return res.errors?.businessId?.first;
      }
      if (res.errors?.roleId != null) {
        return res.errors?.roleId?.first;
      }
      if (res.errors?.email != null) {
        return res.errors?.email?.first;
      }
      if (res.errors?.contactNumber != null) {
        return res.errors?.contactNumber?.first;
      }
      if (res.errors?.name != null) {
        return res.errors?.name?.first;
      }
      if (res.errors?.firebaseUid != null) {
        return res.errors?.firebaseUid?.first;
      }
      if (res.errors?.passwordIsAlreadyReset != null) {
        return res.errors?.passwordIsAlreadyReset?.first;
      }
      if (res.errors?.password != null) {
        return res.errors?.password?.first;
      }
      if (res.errors?.invalidDefaultPassword != null) {
        return res.errors?.invalidDefaultPassword?.first;
      }
      if (res.errors?.invalidCredentials != null) {
        return res.errors?.invalidCredentials?.first;
      }
      if (res.errors?.invalidWorkingHours != null) {
        return res.errors?.invalidWorkingHours?.first;
      }
      // if (res.errors?.assigneeFutureBookings != null) {
      //   return res.errors?.assigneeFutureBookings?.first;
      // }
      if (res.message != null || res.message != "") {
        return res.message;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  String toString() {
    return 'ServerException{errorMessage: $errorMessage, unexpectedError: $unexpectedError, data: ${data.toString()}}';
  }
}

/// Use to throw exception when the user not grant device permissions
class NoPermission implements Exception {}

/// Use to throw platform related exceptions
class DeviceException implements Exception {
  final String message;

  const DeviceException({
    required this.message,
  });
}
