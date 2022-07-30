import 'package:getxnavigationrail/app/data/models/article.dart';

abstract class NewsService {
  Future<List<Article>?> getNews();
}
