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

  String _selectedCategory = 'business';

  List<CategoryModel> categories = [
    CategoryModel(FontAwesomeIcons.building, 'business'),
    CategoryModel(FontAwesomeIcons.tv, 'entertainment'),
    CategoryModel(FontAwesomeIcons.addressCard, 'general'),
    CategoryModel(FontAwesomeIcons.headSideVirus, 'health'),
    CategoryModel(FontAwesomeIcons.vials, 'science'),
    CategoryModel(FontAwesomeIcons.volleyball, 'sports'),
    CategoryModel(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();

    categories.forEach((element) {
      this.categoryArticles[element.name] = [];
    });
  }

  String get selectedCategory => this._selectedCategory;

  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = Uri.https(_URL_BASE_NEWS, 'v2/top-headlines',
        {'sources': 'techcrunch', 'apiKey': _APIKEY});

    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.length > 0) {
      return this.categoryArticles[category];
    }

    // final url = Uri.https(_URL_BASE_NEWS, 'v2/top-headlines',
    //     {'sources': 'techcrunch', 'apiKey': _APIKEY});

    final url = Uri.https(_URL_BASE_NEWS, 'v2/top-headlines', {
      'category': '${category}',
      'pageSize': '20',
      'page': '1',
      'apiKey': _APIKEY
    });

    // final url = Uri.https(_URL_BASE_NEWS, 'v2/top-headlines',
    //     {'sources': 'techcrunch', 'country': 'mx', 'apiKey': _APIKEY});

    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryArticles[category]!.addAll(newsResponse.articles);

    print('Cargo las categorias');
    notifyListeners();
  }
}
