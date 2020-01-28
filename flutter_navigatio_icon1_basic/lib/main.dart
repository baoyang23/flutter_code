import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
import 'animation/first_page.dart';
import 'keeps/keep_alive_case.dart';
import 'warps/warp_demo.dart';
import 'expansions/expansion_tile_demo.dart';

void main() => runApp(new YangExpansion());

class YangExpansion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Fullter Expansion Demo Case',
      theme: new ThemeData.dark(),
      home: ExpansionTileDemo(),
    );
  }
}

class YangWarpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Warp Case',
      theme: new ThemeData.dark(),
      home: WarpDemo(),
    );
  }
}

class YangKeepApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep App Case Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KeepAliveDemo(),
    );
  }
}

class YangSepcialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sepcial Case',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage()
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BottomNavigationBar',
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}
