import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _ListaCategorias()),
        ],
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final cName = categories[index].name;
        return Container(
          width: 110,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                const SizedBox(
                  height: 5,
                ),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CategoryModel category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.getArticlesByCategory(category.name);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: Colors.black54,
        ),
      ),
    );
  }
}
