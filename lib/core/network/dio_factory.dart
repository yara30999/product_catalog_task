import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:products_app/core/resourses/constants_manager.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLangauge = "langauge";
const String xApiKey = "x-api-key";

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      // authorization: ConstantsManager.token,
      // xApiKey: ConstantsManager.xApiKey,
      // defaultLangauge: LanguageType.english.getCode(),
    };

    dio.options = BaseOptions(
      baseUrl: ConstantsManager.baseUrl,
      headers: headers,
      receiveTimeout: ConstantsManager.apiTimeOut,
      sendTimeout: ConstantsManager.apiTimeOut,
    );

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          maxWidth: 120,
          error: true,
          request: true,
        ),
      );
    }

    return dio;
  }
}
