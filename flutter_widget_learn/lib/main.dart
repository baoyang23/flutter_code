import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// void main() => runApp(MyApp());

/*void main() {
  runApp(new MaterialApp(
    title: 'Gavin App',
    home: new YangScaffold(),
  ));
}*/

/*void main() {
  runApp(new MaterialApp(
    title: 'Gavin Title App',
    home: new YangTutorialHome(),
  ));
}*/

// void main() => runApp(new GavinApp());

/*void main() => {
  runApp(new YangGavinApp(items: new List<String>.generate(20, (i) => "Item ${i+1}"),
  ));
}*/

/*void main() {
  runApp(new YangGavinApp(
    items: new List<String>.generate(20, (i) => "Item ${i + 1}"),
  ));
}*/

// void main() => runApp(new YangFirstScreen());

/*void main() {
  runApp(new MaterialApp(
    title: 'Gavin Navigation Basics',
    home: new YangFirstScreen(),
  ));
}*/

void main(){
  runApp(new GavinAnimatedListSample());
}

class GavinAnimatedListSample extends StatefulWidget {
  @override
  _GavinAnimatedListSampleState createState() => new _GavinAnimatedListSampleState();
}

class _GavinAnimatedListSampleState extends State<GavinAnimatedListSample> {

  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  YangListMode<int> _list;
  int _selectedItem;
  int _nextItem;


  @override
  void initState() {
    super.initState();
    _list = new YangListMode<int>(
      listKey: _listKey,
      initialItems: <int>[0,1,2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  Widget _buildItem(BuildContext context,int index,Animation<double> animation){
    return new YangCardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: (){
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  void _insert(){
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  void _remove(){
    if(_selectedItem != null){
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  Widget _buildRemovedItem(int item,BuildContext context,Animation<double> animation){
    return new YangCardItem(
      animation: animation,
      item: item,
      selected: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Gavin List'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: 'Insert Item Only One',
            ),
            new IconButton(icon: const Icon(Icons.delete), onPressed: _remove,tooltip: 'Delete Item',)
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new AnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: _buildItem,
          ),
        ),
      ),
    );
  }
}

class YangListMode<E> {

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  YangListMode({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  }):assert(listKey != null),
     assert(removedItemBuilder != null),
     _items = new List<E>.from(initialItems ?? <E>[]);

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index,E item){
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index){
    final E removedItem = _items.removeAt(index);
    if(removedItem != null){
      _animatedList.removeItem(index, (BuildContext context, Animation<double> animation){
        return removedItemBuilder(removedItem,context,animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;
  E operator [](int index) => _items[index];
  int indexOf(E item) => _items.indexOf(item);
}

class YangCardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  const YangCardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return null;
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128.0,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*void main() {
  runApp(new MaterialApp(
    title: 'Passing Data',
    home: new YangTodosScreen(
      todes: new List.generate(
          20,
          (i) => new YangTodo(
              'Todo $i', 'A description of what needs to be done for Todo $i')),
    ),
  ));
}*/

class YangTodosScreen extends StatelessWidget {
  final List<YangTodo> todes;

  YangTodosScreen({Key key, @required this.todes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return null;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('YangTodos'),
      ),
      body: new ListView.builder(
        itemCount: todes.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(todes[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          new YangDetailScreen(yangTodo: todes[index])));
            },
          );
        },
      ),
    );
  }
}

class YangDetailScreen extends StatelessWidget {
  final YangTodo yangTodo;

  YangDetailScreen({Key key, @required this.yangTodo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${yangTodo.title}'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text('${yangTodo.description}'),
      ),
    );
  }
}

class YangTodo {
  final String title;
  final String description;
  YangTodo(this.title, this.description);
}

class YangFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return null;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('Launch new screen'),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new YangSecordScreen()));
            }),
      ),
    );
  }
}

class YangSecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return null;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('Go back!!!'),
        ),
      ),
    );
  }
}

class YangGavinApp extends StatelessWidget {
  final List<String> items;

  YangGavinApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Gavin Dismissing Items';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return new Dismissible(
                key: new Key(item),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text('$item dismissed')));
                },
                background: new Container(color: Colors.red),
                child: new ListTile(title: new Text('$item')),
              );
            },
          )),
    );
    // return null;
  }
}

class GavinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gavin InkWell Demo';
    return new MaterialApp(
      title: title,
      home: new GavinHomePage(title: title),
    );
    // return null;
  }
}

class GavinHomePage extends StatelessWidget {
  final String title;

  GavinHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return null;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new GavinButton()),
    );
  }
}

class GavinButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return null;
    return new InkWell(
      onTap: () {
        Scaffold.of(context)
            .showSnackBar(new SnackBar(content: new Text('回显的提示内容')));
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Text('Gavin点击按钮'),
      ),
    );
  }
}

class YangCounter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // return new State<StatefulWidget>;
    return null;
  }
}

class YangButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return null;
    return new GestureDetector(
      onTap: () {
        print("Gavin Button On Show!!!!");
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('Gavin Gavin'),
        ),
      ),
    );
  }
}

class YangTutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return null;
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu), tooltip: 'Gavin Menu', onPressed: null),
        title: new Text('Gavin Title'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search Gavin',
              onPressed: null),
        ],
      ),
      body: new Center(
        child: new Text('Gavin Hello World.'),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'Gavin Add', child: new Icon(Icons.add), onPressed: null),
    );
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
            onPressed: null,
          ),
          new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search Gavin',
              onPressed: null)
        ],
      ),
    );
    //return null;
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
              'Gavin Title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
              child: new Center(
            child: new Text("I'm Gavin."),
          ))
        ],
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
