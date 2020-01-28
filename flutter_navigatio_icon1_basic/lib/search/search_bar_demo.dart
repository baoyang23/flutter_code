import 'package:flutter/material.dart';
import 'asset.dart';

class SearchBarDemo extends StatefulWidget {
  _SearchBarDemoCase createState() => _SearchBarDemoCase();
}

class _SearchBarDemoCase extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchDemoCase'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('开始Search操作');
            },
          )
        ],
      ),
    );
  }
}