import 'dart:async';
import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:network/src/entity/exception/exception.dart';
import 'package:shared/models/network_error.dart';
import 'package:shared/utils/either.dart';

NetworkError _mapExceptionEntity(ExceptionEntity error) {
  return NetworkError(
    httpCode: error.code,
    message: error.message.isNotEmpty ? error.message : 'Something went wrong',
    cause: error,
  );
}

Future<Either<NetworkError, T>> safeApiCall<T>(Future<Map> apiCall) async {
  try {
    final response = await apiCall;

    final result = MapperContainer.globals.fromValue<T>(response);
    return right(result);
  } on DioException catch (e) {
    return left(_mapDioExceptionToNetworkError(e));
  } on SocketException catch (e, st) {
    return left(
      NetworkError(
        cause: e,
        stackTrace: st,
        message: 'No internet connection.',
      ),
    );
  } on TimeoutException catch (e, st) {
    return left(
      NetworkError(
        cause: e,
        stackTrace: st,
        message: 'Request timed out. Please try again.',
      ),
    );
  } on IOException catch (e, st) {
    return left(
      NetworkError(
        cause: e,
        stackTrace: st,
        httpCode: 502,
        message: 'Network I/O error.',
      ),
    );
  } on FormatException catch (e, st) {
    return left(
      NetworkError(
        cause: e,
        stackTrace: st,
        httpCode: 500,
        message: 'Invalid server response.',
      ),
    );
  } catch (e, st) {
    return left(
      NetworkError(
        cause: e,
        stackTrace: st,
        httpCode: 500,
        message: 'Something went wrong.',
      ),
    );
  }
}

NetworkError _mapDioExceptionToNetworkError(DioException e) {
  final errorInfo = _extractErrorInfo(e);
  return NetworkError(
    cause: e.error ?? e,
    stackTrace: e.stackTrace,
    httpCode: errorInfo.$1,
    message: errorInfo.$2,
  );
}

(int httpCode, String message) _extractErrorInfo(DioException e) {
  final data = e.response?.data;

  if (data is Map<String, dynamic>) {
    final msg = data['message'] ?? data['error'];
    final int code = data['code'] ?? e.response?.statusCode ?? 0;
    if (msg is String && msg.isNotEmpty) {
      return (code, msg);
    }
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return (
        HttpStatus.gatewayTimeout,
        'Connection timed out. Please try again.',
      );

    case DioExceptionType.connectionError:
      return (HttpStatus.serviceUnavailable, 'No internet connection.');

    case DioExceptionType.cancel:
      return (499, 'Request was cancelled.');

    case DioExceptionType.badResponse:
      return (HttpStatus.badRequest, 'Bad http response.');

    case DioExceptionType.badCertificate:
      return (HttpStatus.badGateway, 'Bad certificate.');

    case DioExceptionType.unknown:
      return (HttpStatus.internalServerError, 'An unknown error occurred');
  }
}
