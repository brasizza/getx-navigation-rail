// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getxnavigationrail/app/data/core/rest/rest_client.dart';
import 'package:getxnavigationrail/app/data/models/article.dart';

import 'news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final RestClient _rest;
  NewsRepositoryImpl({
    required RestClient rest,
  }) : _rest = rest;
  @override
  Future<List<Article>?> getNews({required String url}) async {
    final dados = await _rest.get(url);

    if (dados.statusCode != 200) {
      return null;
    } else {
      if (dados.data != null) {
        return (dados.data as List).map<Article>((article) => Article.fromMap(article)).toList();
      } else {
        return null;
      }
    }
  }
}
