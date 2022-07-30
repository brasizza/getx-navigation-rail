// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:get/get.dart';
import 'package:getxnavigationrail/app/data/models/article.dart';
import 'package:getxnavigationrail/app/data/services/news/news_service.dart';

class NewsController extends GetxController with StateMixin<Article?> {
  final NewsService _service;

  NewsController({
    required NewsService service,
  }) : _service = service;

  final news = <Article>[].obs;

  @override
  void onInit() async {
    super.onInit();
    getNews();
  }

  void getNews() async {
    change(null, status: RxStatus.loading());
    try {
      final result = await _service.getNews();
      if (result != null) {
        news.addAll(result.toList());
      }
      if (news.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(randomNew, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error('Fail to get news'));
    }
  }

  void getRandomNew() async {
    change(null, status: RxStatus.loading());
    change(randomNew, status: RxStatus.success());
  }

  Article get randomNew {
    final int index = Random().nextInt(news.length - 1);
    return news[index];
  }
}
