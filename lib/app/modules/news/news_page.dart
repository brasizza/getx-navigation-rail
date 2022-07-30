import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnavigationrail/app/modules/news/components/article_page.dart';

import './news_controller.dart';

class NewsPage extends GetView<NewsController> {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("RANDOM NEWS ABOUT SPACE!"),
        ),
        Expanded(
          child: controller.obx(
            (article) {
              return Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controller.getRandomNew();
                      },
                      child: const Text("Another random new")),
                  ArticlePage(article: article!),
                ],
              );
            },
            onEmpty: const Text("No news to show for you!"),
            onLoading: const Center(child: CircularProgressIndicator.adaptive()),
            onError: (error) => Text(error.toString()),
          ),
        ),
      ],
    );
  }
}
