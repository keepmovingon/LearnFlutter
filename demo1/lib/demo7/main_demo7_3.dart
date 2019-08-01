import 'package:flutter/material.dart';

import '../res/listData.dart';  // 引入外部数据

/**
 * 
 * Flutter GridView 组件以及动态 GridView
 * 
 * GridView 组件实现列表的布局(网格布局，类似商品列表)
 * 
 * 创建网格布局的方式：
 * 
 *  1. 通过 GridView.count 实现网格布局
 * 
 *  2. 通过 GridView.builder 实现网格布局（类似 ListView.builder 实现动态网格）
 * 
 *  */


//  通过 GridView.count 实现网格布局

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlutterDemo'),
        ),
        body: HomeContent(),
      ),
    );
  }
}


// 将外部数据 渲染到网格中，实现一个类似商品列表的布局

class HomeContent extends StatelessWidget {
  // 自定义方法
  List<Widget> _getData() {
    
    var tempList = listData.map((value) {

      return Container(

        child: Column(

          children: <Widget>[

            Image.network(value["imageUrl"]),
            SizedBox(height: 12,),  // 设置间距
            Text(
              value["title"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(

          border: Border.all(

            width: 1,
            color: Color.fromRGBO(233, 233, 233, 0.9),
          )
        ),
      );
    });

    return tempList.toList(); // map 返回的数据格式('xxx','yyy',...) 一定要记住 toList()
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(

      crossAxisCount: 2, // 设置一行 Widget 的数量

      padding: EdgeInsets.all(10),
      mainAxisSpacing: 10, // 设置 item 上下的距离
      crossAxisSpacing: 10, // 设置 item 左右的距离
      // childAspectRatio: 0.7, // 设置 item 宽高的比例

      children: this._getData(),
    );
  }
}
