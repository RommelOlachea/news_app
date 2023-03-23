import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
      body: (headlines.length == 0)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListaNoticias(headlines),
    );
  }

  @override
  bool get wantKeepAlive =>
      true; //con esto no destruimos la pantalla y se mantiene el estado
}
