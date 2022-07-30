import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getxnavigationrail/app/data/core/rest/dio/dio_rest_client.dart';
import 'package:getxnavigationrail/app/data/core/rest/get_connect/get_connect_rest_client.dart';
import 'package:getxnavigationrail/app/data/core/rest/get_connect/rest_get_connect.dart';
import 'package:getxnavigationrail/app/data/core/rest/rest_client.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<RestClient>(() => GetConnectRestClient(http: Get.put<RestGetConnect>(RestGetConnect(), permanent: true)), tag: 'GET', fenix: true);
    Get.lazyPut<RestClient>(() => DioRestClient(dio: Dio()), tag: 'DIO', fenix: true);
  }
}
