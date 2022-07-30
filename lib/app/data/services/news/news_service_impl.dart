// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/state_manager.dart';
import 'package:getxnavigationrail/app/data/models/article.dart';
import 'package:getxnavigationrail/app/data/repositories/news/news_repository.dart';

import 'news_service.dart';

class NewsServiceImpl extends GetxService implements NewsService {
  final NewsRepository _repository;
  NewsServiceImpl({
    required NewsRepository repository,
  }) : _repository = repository;

  @override
  Future<List<Article>?> getNews() async {
    String url = 'https://api.spaceflightnewsapi.net/v3/articles?_limit=100';
    return await _repository.getNews(url: url);
  }
}
