import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: 0, items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), label: 'Para ti'),
      BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
    ]);
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      // physics: BouncingScrollPhysics(),
      physics:
          NeverScrollableScrollPhysics(), //con esto evitamos el scroll, y no cambiamos de tab
      children: [
        Container(color: Colors.red),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}
