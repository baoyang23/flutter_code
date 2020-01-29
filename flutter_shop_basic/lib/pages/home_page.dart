import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //getHttp();
    return Scaffold(
      body: Center(
        child: Text('Shop首页'),
      ),
    );
  }

  /**
   *  测试使用 Dio 来发送请求获取数据;调用API接口。
   *
   */
  void getHttp() async {
    try{
      Response response;
      var data = {'name':'技术胖'};
      response = await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女");
      return print(response);
    }catch(e){
      return print(e);
    }
  }
}