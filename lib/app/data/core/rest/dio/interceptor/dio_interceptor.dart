import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class DioInterceptorAuth extends InterceptorsWrapper {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      var localizationDelegate = Get.deviceLocale?.languageCode ?? 'pt-br';
      options.queryParameters['lang'] = localizationDelegate;
    } catch (_) {
      options.queryParameters['lang'] = 'pt';
    }

    String logDev = '';
    logDev += ("*************** REQUEST LOG ***************\n");
    logDev += ('url ${options.uri}\n');
    logDev += ('method ${options.method}\n');
    logDev += ('data ${options.data}\n ');
    logDev += ('headers ${options.headers} \n');
    log(logDev);

    handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    String logDev = '';
    logDev += ("*************** RESPONSE LOG ***************\n");
    logDev += ('url ${response.requestOptions.uri}\n');
    logDev += ('code ${response.statusCode}\n');
    logDev += ('method ${response.requestOptions.method}\n');
    logDev += ('data ${response.data}\n ');
    log(logDev);
    handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    log(err.toString());
    handler.next(err);
  }
}
