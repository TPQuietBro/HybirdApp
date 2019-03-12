import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class InteractionF2OC extends StatefulWidget {
  @override
  InteractionState createState() => InteractionState();
}

class InteractionState extends State<InteractionF2OC> {
  static const platform = const MethodChannel('com.allen.test.call');
  String message = 'null message';

  void _getNativeMessage() async{
    String result;
    try {
      result = await platform.invokeMethod('getFlutterMessage',[1,2,3]);
    } on PlatformException catch (e) {
      result = "error message $e";
    }
    setState(() {
      message = result;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test page')
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('get message'),
              onPressed: (){
                _getNativeMessage();
              },
            ),
            Text(message)
          ],
        ),
      ),
    );
  }
}
