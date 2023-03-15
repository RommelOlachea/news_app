import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() {
    print('Cargando headlines...');
  }
}
