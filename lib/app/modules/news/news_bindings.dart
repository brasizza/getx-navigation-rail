import 'package:get/get.dart';
import 'package:getxnavigationrail/app/data/core/constants.dart';
import 'package:getxnavigationrail/app/data/core/rest/rest_client.dart';
import 'package:getxnavigationrail/app/data/repositories/news/news_repository.dart';
import 'package:getxnavigationrail/app/data/repositories/news/news_repository_impl.dart';
import 'package:getxnavigationrail/app/data/services/news/news_service.dart';
import 'package:getxnavigationrail/app/data/services/news/news_service_impl.dart';

import './news_controller.dart';

class NewsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<NewsRepository>(NewsRepositoryImpl(rest: Get.find<RestClient>(tag: Constants.rest)));
    Get.put<NewsService>(NewsServiceImpl(repository: Get.find()));
    Get.put(NewsController(service: Get.find()));
  }
}
