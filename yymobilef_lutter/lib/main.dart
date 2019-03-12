import 'package:flutter/material.dart';
import 'InteractionFlutter2OC.dart';
import 'InteractionOC2Flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'this is my house',
      theme: ThemeData(
        primaryColor: Colors.purple
      ),
      // home: InteractionF2OC(),
      home: InteractionOC2F(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}
class  HomeState extends State<Home> {
  // 跳转下一个界面
  void _pushSecondView(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NextView('123');
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage213'),
        backgroundColor: Colors.brown
      ),
      body: Center(
        child: Text('Some content'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'click to another widget',
        onPressed: (){
          _pushSecondView();
        },
      ),
    );
  }
}
class NextView extends StatelessWidget {
  NextView(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second View'),
      ),
      body: Center(
        child: Text('this is the second view')
      )
    );
  }
}

