import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    String accountNumber,selectType;

    void submitForm() {
      print('accountNumber ---> $accountNumber');
      print('selectType - - - > $selectType');
    }

    final moneyText = TextFormField(
      //key: RegisterKey,
      keyboardType: TextInputType.number,
      initialValue: "0",
      inputFormatters: [
        WhitelistingTextInputFormatter(RegExp("[0-9.]"))
      ],
      decoration: InputDecoration(
        // hintText: '金额',
          labelText: '请输入记账金额',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),

      onChanged: (value){
        accountNumber = value;
      },
    );

    final dropButtonCase = DropdownButtonHideUnderline(
      child: new DropdownButton(
        items: [
          new DropdownMenuItem(
            child: new Text('同意'),
            value: '同意',
          ),
          new DropdownMenuItem(
            child: new Text('拒绝'),
            value: '拒绝',
          ),
        ],

        hint: new Text('请选择'),
        onChanged: (value){
          selectType = value;
        },
        value: selectType,
        elevation: 24,
        style: new TextStyle(
          color: Color(0xff4a4a4a),
          fontSize: 12,
        ),
        iconSize: 40.0,
      ),
    );


    final addButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: submitForm,
          color: Colors.blue,
          child: Text('记 账', style: TextStyle(color: Colors.white, fontSize: 15.0),),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('记账首页'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            dropButtonCase,
            SizedBox(
              height: 24.0,
            ),
            moneyText,
            SizedBox(
              height: 48.0,
            ),
            addButton
          ],
        ),
      ),
    );
  }
}