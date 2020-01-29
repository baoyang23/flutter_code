import 'package:flutter/material.dart';

class AccountScreent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar 部分'),
      ),

      body: Center(
        child: Text('Account 的 body 部分'),
      ),
    );

  }
}