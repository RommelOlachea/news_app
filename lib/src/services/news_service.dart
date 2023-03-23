import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:http/http.dart' as http;

final _URL_BASE_NEWS = 'newsapi.org';
final _APIKEY = '165fbad9254b423ca547b59bb2282486';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];
  List<CategoryModel> categories = [
    CategoryModel(FontAwesomeIcons.building, 'business'),
    CategoryModel(FontAwesomeIcons.tv, 'entertainment'),
    CategoryModel(FontAwesomeIcons.addressCard, 'general'),
    CategoryModel(FontAwesomeIcons.headSideVirus, 'health'),
    CategoryModel(FontAwesomeIcons.vials, 'science'),
    CategoryModel(FontAwesomeIcons.volleyball, 'sports'),
    CategoryModel(FontAwesomeIcons.memory, 'technology'),
  ];

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
