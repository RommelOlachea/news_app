import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_BASE_NEWS = 'newsapi.org';
final _APIKEY = '165fbad9254b423ca547b59bb2282486';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https(_URL_BASE_NEWS, 'v2/top-headlines',
        {'sources': 'techcrunch', 'apiKey': _APIKEY});

    final resp = await http.get(url);
    final newsResponse = newResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
