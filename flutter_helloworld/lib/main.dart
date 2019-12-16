import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/foundation.dart';

// void main() => runApp(MyApp());

/*void main() {
  runApp(new MaterialApp(
    title: 'Gavin App',
    home: new YangScaffold(),
  ));
}*/

// void main() => runApp(new YangListTwo());

/*void main() {
  runApp(new YangListThree(
    items: new List<String>.generate(10000, (i) => "Item $i"),
  ));
}*/

/*void main() {
  runApp(new YangListFour(
    items: new List<YangListItem>.generate(
        100,
        (i) => i % 6 == 0
            ? new YangHandingItem("Heading $i")
            : new YangMessageItem("Sender $i", "Message body $i")),
  ));
}*/

/*void main() {
  runApp(new YangListFive());
}*/

void main() => runApp(new YangButtonPageApp());

class YangButtonPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return null;
    final title = 'Gavin Button Demo';
    return new MaterialApp(
      title: title,
      home: new YangHomePage(title:title),
    );
  }
}

class YangHomePage extends StatelessWidget {
  final String title;

  YangHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return null;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new YangButtonOne(),
      ),
    );
  }
}

class YangButtonOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("点击Gavin小脸"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: new Text('Gavin Buttion'),
      ),
    );
    // return null;
  }
}

class YangListFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gavin Yang Grid List';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new GridView.count(
          crossAxisCount: 2,
          children: new List.generate(15, (index) {
            index = index + 1;
            return new Center(
              child: new Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),
      ),
    );
    // return null;
  }
}

class YangListFour extends StatelessWidget {
  final List<YangListItem> items;

  YangListFour({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Gavin Yang List';
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final it = items[index];
          if (it is YangHandingItem) {
            return new ListTile(
              title: new Text(
                it.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (it is YangMessageItem) {
            return new ListTile(
                title: new Text(it.sender), subtitle: new Text(it.body));
          }
        },
      ),
    ));
    // return null;
  }
}

abstract class YangListItem {}

class YangHandingItem implements YangListItem {
  final String heading;
  YangHandingItem(this.heading);
}

class YangMessageItem implements YangListItem {
  final String sender;
  final String body;
  YangMessageItem(this.sender, this.body);
}

class YangListThree extends StatelessWidget {
  final List<String> items;

  YangListThree({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Gavin List';
    return new MaterialApp(
        title: title,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return new ListTile(
                title: new Text('${items[index]}'),
              );
            },
          ),
        ));
    // return null;
  }
}

class YangListTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gavin Horizontal List';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Container(
          margin: new EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new Container(
                width: 160.0,
                color: Colors.red,
              ),
              new Container(
                width: 160.0,
                color: Colors.blue,
              ),
              new Container(
                width: 160.0,
                color: Colors.green,
              ),
              new Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              new Container(
                width: 160.0,
                color: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
    // return null;
  }
}

class YangListOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gavin One List';
    return new MaterialApp(
        title: title,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new ListView(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.map),
                title: new Text('Map'),
              ),
              new ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Album'),
              ),
              new ListTile(
                leading: new Icon(Icons.phone),
                title: new Text('phone'),
              )
            ],
          ),
        ));
    //return null;
  }
}

class YangImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Web Images';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        // body: new Image.network('https://avatar.csdnimg.cn/F/6/C/3_ainuser.jpg'),
        body: new Stack(
          children: <Widget>[
            new Center(child: new CircularProgressIndicator()),
            new Center(
              child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://avatar.csdnimg.cn/F/6/C/3_ainuser.jpg'),
            )
          ],
        ),
      ),
    );
    // return null;
  }
}

class YangAppBar extends StatelessWidget {
  final Widget title;

  YangAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Gavin Menu',
              onPressed: null),
          new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: 'Search', onPressed: null)
        ],
      ),
    );
    // return null;
  }
}

class YangScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new YangAppBar(
            title: new Text(
              'GavinYang Title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
              child: new Center(
            child: new Text('Hello GavinYang,World.'),
          ))
        ],
      ),
    );
    // return null;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
