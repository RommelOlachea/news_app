import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(color: Colors.red),
          Container(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
