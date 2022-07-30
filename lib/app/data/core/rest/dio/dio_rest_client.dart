// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'dio.dart';

class DioRestClient implements RestClient {
  final Dio _dio;
  DioRestClient({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<RestClientResponse<T>> delete<T>(String path, {data, String? contentType, String? requestType, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers, contentType: contentType, responseType: (requestType == 'text/plain') ? ResponseType.plain : ResponseType.json),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path, {data, String? contentType, String? requestType, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers, contentType: contentType, responseType: (requestType == 'text/plain') ? ResponseType.plain : ResponseType.json),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(String path, {data, String? contentType, String? requestType, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers, contentType: contentType, responseType: (requestType == 'text/plain') ? ResponseType.plain : ResponseType.json),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path, {data, String? contentType, String? requestType, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers, contentType: contentType, responseType: (requestType == 'text/plain') ? ResponseType.plain : ResponseType.json),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path, {data, String? contentType, String? requestType, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers, contentType: contentType, responseType: (requestType == 'text/plain') ? ResponseType.plain : ResponseType.json),
      );

      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    late dynamic data;

    data = (response.data);

    return RestClientResponse<T>(
      data: data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Never _throwRestClientException(DioError dioError) {
    final response = dioError.response;

    final error = RestClientException(
      error: dioError.error,
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      response: RestClientResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
    log(response?.statusMessage ?? '');
    throw error;
  }

  @override
  Future<RestClientResponse<T>> request<T>(String path, {required String method, data, String? contentType, String? requestType, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Encoding? encoding}) async {
    try {
      final response = await _dio.request(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers, contentType: contentType, responseType: (requestType == 'text/plain') ? ResponseType.plain : ResponseType.json),
      );
      return _dioResponseConverter(response);
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }
}
