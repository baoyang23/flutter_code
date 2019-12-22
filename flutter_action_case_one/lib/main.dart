import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// void main() => runApp(MyApp());

void main() => runApp(new GavinSwitchAndCheckBoxTestRouteApp());

class GavinSwitchAndCheckBoxTestRouteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return MaterialApp(
      title: 'Flutter Counter Demo',
      home: new GavinSwitchAndCheckBoxTestRoute(),
    );
  }
}

class GavinSwitchAndCheckBoxTestRoute extends StatefulWidget {

  _GavinSwitchAndCheckBoxTestRouteState createState() => new _GavinSwitchAndCheckBoxTestRouteState();
}

class _GavinSwitchAndCheckBoxTestRouteState extends State<GavinSwitchAndCheckBoxTestRoute> {

  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value){
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value){
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}

class GavinImageAndIconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    var img = AssetImage("images/avatar.png");
    return SingleChildScrollView(
      child: Column(
        children: <Image>[
          Image(
            image: img,
            height: 50.0,
            width: 100.0,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            height: 50.0,
            width: 100.0,
            fit: BoxFit.contain,
          ),
          Image(
            image: img,
            height: 50.0,
            width: 100.0,
            fit: BoxFit.cover,
          )
        ].map((e){
          return Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 100,
                  child: e,
                ),
              ),
              Text(e.fit.toString())
            ],
          );
        }).toList(),
      ),
    );
  }
}

class GavinParentWidget extends StatefulWidget {

  @override
  _GavinParentWidgetState createState() => new _GavinParentWidgetState();
}

class _GavinParentWidgetState extends State<GavinParentWidget> {

  bool _isactive = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      this._isactive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return new Container(
      child: new TapboxTwo(
        active: _isactive,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxTwo extends StatelessWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxTwo({Key key,this.active:false,@required this.onChanged}):super(key:key);

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: active ? Colors.lightGreen[700]:Colors.grey[600],
        ),
      ),
    );
  }
}


class MyGavinTopBoxOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return MaterialApp(
      title: 'Flutter Counter Demo',
      home: new GavinParentWidget(),
    );
  }
}


class GavinTopBoxOne extends StatefulWidget {

  GavinTopBoxOne({Key key}) : super(key:key);

  @override
  _GavinTopBoxOneState createState() => new _GavinTopBoxOneState();
}

/**
 * 自己管理自己的状态
 */
class _GavinTopBoxOneState extends State<GavinTopBoxOne> {

  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  void _doit(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Avtive' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class GavinEchoHome extends StatefulWidget {
  _GavinEchoPageHome createState() => new _GavinEchoPageHome();
}

class _GavinEchoPageHome extends State<GavinEchoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Gavin Test Echo'),
      ),
      body: Container(
        child: Builder(builder: (context){
          return GavinEcho(text: 'Echo Hello World.');
        }),
      ),
    );
  }
}

class GavinEcho extends StatelessWidget {

  final String text;
  final Color backgroundColor;

  const GavinEcho({
    Key key,@required this.text,this.backgroundColor:Colors.grey,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class GavinRandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class GavinTestRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return Center(
      child: RaisedButton(
        onPressed: () async {
          var result =   await Navigator.push(context, MaterialPageRoute(builder: (context){
            return GavinTipRoute(text: '我是来自Gavin的提示信息');
          }));
          print('　路由返回的信息 $result');
        },
        child: Text('网络遇见问题,无法打开.'),
      ),
    );
  }
}

class GavinTipRoute extends StatelessWidget {

  final String text;

  GavinTipRoute({Key key,@required this.text}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('来自Gavin的提示信息'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),RaisedButton(
                onPressed: () => Navigator.pop(context,'来自Gavin的返回值'),
                child: Text('返回'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GavinNewRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return new Scaffold(
      appBar: AppBar(
        title: Text('New Router'),
      ),
      body: Center(
        child: Text('This is new Gavin Router.'),
      ),
    );
  }
}

class MyCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return MaterialApp(
      title: 'Flutter Counter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new GavinHomePage(title: 'Flutter Counter Page Home'),
    );
  }
}


class GavinHomePage extends StatefulWidget {

  final String title;

  GavinHomePage({Key key, this.title}) : super(key : key);

  @override
  _GavinHomePageState createState() => new _GavinHomePageState();
}

class _GavinHomePageState extends State<GavinHomePage> {

  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter ++;
    });
  }


  void _reduceCounter(){
    setState(() {
      _counter --;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return null;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You have pushed the button this many times ',),
            new Text('$_counter',style: Theme.of(context).textTheme.display1,),
            FlatButton(
              child: Text('New Open router'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return GavinNewRouter();
                }));
              },
            ),
            GavinRandomWordsWidget(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _reduceCounter,
        tooltip: '增加/减少',
        child: new Icon(Icons.arrow_back),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
