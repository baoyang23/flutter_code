import 'package:flutter/material.dart';
import 'pages/account_screen.dart';
import 'pages/home_screen2.dart';

// void main() => runApp(new BottomNavigationWidget());

// Start Application.
void main() => runApp(new ApplicationApp());

class ApplicationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LWF Account Book App',
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  final _BottomNavigationColor = Colors.blue;

  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list..add(HomeScreen())
        ..add(AccountScreent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:Icon(
                Icons.home,
                color:_BottomNavigationColor,
              ),
              title:Text(
                  '首页',
                  style:TextStyle(color:_BottomNavigationColor)
              )
          ),

          BottomNavigationBarItem(
              icon:Icon(
                Icons.account_circle,
                color:_BottomNavigationColor,
              ),
              title:Text(
                  '个人中心',
                  style:TextStyle(color:_BottomNavigationColor)
              )
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}