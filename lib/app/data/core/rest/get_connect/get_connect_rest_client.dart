import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get_connect.dart';

import 'get_connect_rest.dart';
import 'rest_get_connect.dart';

class GetConnectRestClient implements RestClient {
  late Response response;
  final RestGetConnect http;

  GetConnectRestClient({required this.http}) {
    log('Start the GetConnectRestClient  instance');
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? contentType, String? requestType, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.delete((path), headers: newHeaders, query: queryParameters, contentType: contentType);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? contentType, String? requestType}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.get((path), headers: newHeaders, contentType: contentType);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Encoding? encoding,
    String? contentType,
    String? requestType,
  }) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.patch(path, null, headers: newHeaders, query: queryParameters, contentType: contentType);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path, {data, Map<String, dynamic>? queryParameters, String? contentType, String? requestType, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.post((path), data, headers: newHeaders, query: queryParameters, contentType: contentType);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? contentType, String? requestType, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.put((path), data, headers: newHeaders, query: queryParameters, contentType: contentType);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path, {required String method, data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, String? contentType, String? requestType, Encoding? encoding}) async {
    try {
      Map<String, String>? newHeaders = (headers == null) ? null : headers as Map<String, String>;
      response = await http.post((path), data, headers: newHeaders, query: queryParameters, contentType: contentType);
      return httpResponseConverter(response);
    } on HttpException catch (e) {
      _throwRestClientException(e, response);
    }
  }

  Future<RestClientResponse<T>> httpResponseConverter<T>(Response response) async {
    late dynamic data;

    data = (response.body);

    return RestClientResponse<T>(data: (data), statusCode: response.statusCode, statusMessage: '');
  }

  Never _throwRestClientException(HttpException exception, Response? response) {
    late dynamic data;
    data = (response == null) ? '' : (response.body);
    throw RestClientException(
      error: exception.message,
      message: exception.message,
      statusCode: response?.statusCode,
      response: RestClientResponse(
        data: data,
        statusCode: response?.statusCode,
        statusMessage: exception.message,
      ),
    );
  }
}
