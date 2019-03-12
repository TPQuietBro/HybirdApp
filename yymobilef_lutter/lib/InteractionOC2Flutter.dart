import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InteractionOC2F extends StatefulWidget {
  @override
  InteractionState createState() => InteractionState();
}

class InteractionState extends State<InteractionOC2F> {
  static const EventChannel eChanel = const EventChannel('com.allen.test.post');
  @override
  void initState(){
    super.initState();
    eChanel.receiveBroadcastStream("flutter 监听了通知").listen(_onEvent,onError: _onError);
  }
  String _message = 'null message';

  _onEvent(Object event){
    setState(() {
      _message = event.toString();
    });
  }

  _onError(Object error){
    setState(() {
      _message = "error message : $error";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test page')
      ),
      body: Center(
        child: Text(_message),
      ),
    );
  }
}
