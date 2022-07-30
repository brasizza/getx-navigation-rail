import 'package:getxnavigationrail/app/data/models/article.dart';

abstract class NewsRepository {
  Future<List<Article>?> getNews({required String url});
}
