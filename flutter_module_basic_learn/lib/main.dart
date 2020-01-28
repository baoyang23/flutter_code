import 'package:flutter/material.dart';

// void main() => runApp(YangViewList());

//void main() => runApp(YangListParam(items: new List<String>.generate(1000, (i) => 'Item $i')));

void main() => runApp(YangCardListBasicOne());

class YangCardListBasicOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: new Text('Yang One'),
            subtitle: new Text('Yang One Subtitle'),
            leading: new Icon(Icons.account_box,color:Colors.lightBlue,),
          ),
          new Divider(),
          ListTile(
            title: new Text('Yang Two'),
            subtitle: new Text('Yang Two Subtitle'),
            leading: new Icon(Icons.account_box,color:Colors.lightBlue,),
          ),
          new Divider(),
          ListTile(
            title: new Text('Yang Three'),
            subtitle: new Text('Yang Three Subtitle'),
            leading: new Icon(Icons.account_box,color:Colors.lightBlue,),
          ),
          new Divider(),
        ],
      ),
    );

    return MaterialApp(
      title: 'Yang Card List View',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('卡片布局操作'),
        ),
        body: Center(child: card,),
      ),
    );
  }
}

class YangStackImageBasicOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var stack = new Stack(
      alignment: const FractionalOffset(0.5, 0.8),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage('https://img14.360buyimg.com/pop/s1180x940_jfs/t1/97733/27/10037/93770/5e159e3eEdc7a4241/7e038b38040faa38.jpg.webp'),
          radius: 100.0,
        ),
       new Positioned(
         top: 10.0,
         left: 10.0,
         child: new Text('Yang.com'),
       ),
       new Positioned(
         bottom: 10.0,
         right: 10.0,
         child: new Text('Yangge Blog'),
       )
       /* new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlue,
          ),
          padding: EdgeInsets.all(5.0),
          child: new Text('Yang Blog Content'),
        )*/
      ],
    );
    return MaterialApp(
      title: 'List View Stack Case',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('垂直方向操作'),
        ),
        body: Center(child: stack),
      ),
    );
  }
}

class YangExpandedBasicOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yang Expanded List Param',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('水平方向布局'),
        ),
        body: new Row(
          children: <Widget>[
            Expanded(child: new RaisedButton(
              onPressed: (){},
              color: Colors.redAccent,
              child: new Text('红色的按钮'),
            )),
            Expanded(child: new RaisedButton(
              onPressed: (){},
              color: Colors.yellowAccent,
              child: new Text('黄色的按钮'),
            )),
            Expanded(child: new RaisedButton(
              onPressed: (){},
              color: Colors.pinkAccent,
              child: new Text('粉色的按钮'),
            )),
          ],
        ),
      ),
    );
  }
}

class YangRowOneBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yang Row Code Learn',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('水平方向的布局'),
        ),
        body: new Row(
          children: <Widget>[
            new RaisedButton(
              onPressed: (){},
              color: Colors.redAccent,
              child: new Text('红色的按钮'),
            ),
            new RaisedButton(
              onPressed: (){},
              color: Colors.orangeAccent,
              child: Text('橙色的按钮'),
            ),
            new RaisedButton(
              onPressed: (){},
              color: Colors.pinkAccent,
              child: Text('粉色的按钮'),
            )
          ],
        ),
      ),
    );
  }
}

class YangGridImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yang List Grid Images',
      home: Scaffold(
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.7
          ),
          children: <Widget>[
            new Image.network('http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',fit: BoxFit.cover),
            new Image.network('http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}

class YangGridListParam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yang List App Param',
      home: Scaffold(
        body: GridView.count(
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 3,
          children: <Widget>[
            const Text('Yang Onexxxxxxxxxx'),
            const Text('Yang 2'),
            const Text('Yang 3'),
            const Text('Yang 4'),
            const Text('Yang 5'),
            const Text('Yang 6'),
            const Text('Yang 7'),
            const Text('Yang 8'),
          ],
        ),
      ),
    );
  }
}

class YangListParam extends StatelessWidget {

  final List<String> items;

  YangListParam({Key key,@required this.items}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yang List View Param',
      home: Scaffold(
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}

class YangViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yang Flutter Demo Case',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('List View One Widght'),
        ),
        // body: new Text('List View One Text'),
        body: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.access_time),
              title: new Text('access_time'),
            ),
            new ListTile(
              leading: new Icon(Icons.add),
              title: new Text('这是添加符号'),
            )
          ],
        ),
      ),
    );
  }
}

class YangApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yang Text Widget',
      home: Scaffold(
        body: Center(
          child: Text(
              'Yang Text Content  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxxx',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 25.0,
                color: Color.fromARGB(255, 255, 150, 150),
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
              // maxLines: 1,
          ),
        ),
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
