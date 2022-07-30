import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class RestGetConnect extends GetConnect {
  @override
  void onInit() async {
    super.onInit();

    httpClient.addRequestModifier((Request request) async {
      var newUrl = request.url.replace(
        queryParameters: {
          ...request.url.queryParameters,
        },
      );

      debugPrint('Iniciando em :${request.url}');

      return request.copyWith(
          url: newUrl,
          // contentLength: request.contentLength,
          bodyBytes: request.bodyBytes,
          followRedirects: true,
          maxRedirects: 10);
    });

    httpClient.addAuthenticator((Request request) async {
      // Response response = await post(urlEmpresa + '/auth', {'client_id': 'b3508d83-a1cb-3b17-b945-ca7100eec41b', 'password': 'a8c06426-c17a-35dd-a5e8-65d83810de27'});
      // if (response.statusCode == 200) {
      //   await prefs.registerAccessToken(response.body['access_token']);
      //   request.headers['Authorization'] = "Bearer ${response.body['access_token']}";
      // }
      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      debugPrint('Resposta de :${request.url}\nstatusCode: ${response.statusCode}');
      if (response.statusCode != 200) {
        debugPrint('\nERRO: ${response.body}');
      }

      return response;
    });

    httpClient.timeout = const Duration(seconds: 30);
    httpClient.maxAuthRetries = 3;
  }
}
