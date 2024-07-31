import 'dart:convert';
import 'package:dio/dio.dart';

String serverErrorDataToJson(ServerErrorData data) => json.encode(data.toJson());

/// This will store error data for the [ServerException]
class ServerErrorData {
  late final RequestData requestData;
  late final ResponseData responseData;

  ServerErrorData.fromDioError(DioException e) {
    requestData = RequestData(
      url: e.requestOptions.uri.toString(),
      method: e.requestOptions.method,
      contentType: e.requestOptions.contentType,
      headers: e.requestOptions.headers,
      receiveTimeout: e.requestOptions.receiveTimeout,
      sendTimeout: e.requestOptions.sendTimeout
    );
    responseData = ResponseData(
      statusCode: e.response?.statusCode??999,
      statusMessage: e.response?.statusMessage?? 'n/a',
      data: e.response?.data??'{}',
      isRedirect: e.response?.isRedirect??false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "requestData": requestData.toJson(),
      "responseData": responseData.toJson(),
    };
  }
}

class RequestData {
  /// Http method.
  final String? url;

  /// Http method.
  final String? method;

  /// Http request headers.
  final Map<String, dynamic>? headers;

  /// Timeout in milliseconds for sending data.
  final Duration? sendTimeout;

  ///  Timeout in milliseconds for receiving data.
  final Duration? receiveTimeout;

  /// The request Content-Type. The default value is [ContentType.json].
  final String? contentType;

  const RequestData({
    this.url,
    this.method,
    this.headers,
    this.sendTimeout,
    this.receiveTimeout,
    this.contentType,
  });

  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "method": method,
      "headers": headers,
      "sendTimeout": sendTimeout,
      "receiveTimeout": receiveTimeout,
      "contentType": contentType,
    };
  }
}

class ResponseData {
  /// Response body.
  final dynamic data;

  /// Http status code.
  final int? statusCode;

  /// Reason phrase associated with the status code.
  final String? statusMessage;

  /// Whether this response is a redirect.
  final bool? isRedirect;

  const ResponseData({
    required this.data,
    this.statusCode,
    this.statusMessage,
    this.isRedirect,
  });

  Map<String, dynamic> toJson() {
    return {
      "data": data,
      "statusCode": statusCode,
      "statusMessage": statusMessage,
      "isRedirect": isRedirect,
    };
  }
}
