import 'package:easy_localization/easy_localization.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    // default error
    failure = DataSource.unknown.getFailure();
  }
}

enum DataSource {
  success,
  noContect,
  badRequest,
  badCertificate,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  recieveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContect:
        return Failure(ResponseCode.noContect, ResponseMessage.noContect);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.badCertificate:
        return Failure(
          ResponseCode.badCertificate,
          ResponseMessage.badCertificate,
        );
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError,
        );
      case DataSource.connectionTimeout:
        return Failure(
          ResponseCode.connectionTimeout,
          ResponseMessage.connectionTimeout,
        );
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.recieveTimeout:
        return Failure(
          ResponseCode.recieveTimeout,
          ResponseMessage.recieveTimeout,
        );
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection,
        );
      case DataSource.unknown:
        return Failure(ResponseCode.unknown, ResponseMessage.unknown);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContect = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int badCertificate = 42; //
  static const int unauthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  // local status code
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int recieveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
}

class ResponseMessage {
  static String get success => 'success'.tr();
  static String get noContect => 'success'.tr();
  static String get badRequest => 'bad_request_error'.tr();
  static String get badCertificate => 'incorrect_certificate_error'.tr();
  static String get unauthorized => 'unauthorized_error'.tr();
  static String get forbidden => 'forbidden_error'.tr();
  static String get internalServerError => 'internal_server_error'.tr();
  static String get notFound => 'not_found_error'.tr();
  static String get connectionTimeout => 'connection_timeout_error'.tr();
  static String get cancel => 'cancel_error'.tr();
  static String get recieveTimeout => 'recieve_timeout_error'.tr();
  static String get sendTimeout => 'send_timeout_error'.tr();
  static String get cacheError => 'cache_error'.tr();
  static String get noInternetConnection => 'no_internet_connection_error'.tr();
  static String get unknown => 'unknown_error'.tr();
}
