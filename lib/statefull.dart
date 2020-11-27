import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clock/clock.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Controller extends GetxController {
  var time = callback();
  var count = 0.obs;
  increment() => count--;
}

T runWithTiming<T>(T callback()) {
  var stopwatch = clock.stopwatch()..start();
  var result = callback();
  print("It took ${stopwatch.elapsed}!");
  return result;
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('TESTANDO CONTADOR:'),
            Obx(
              () => Text("Clicks: ${c.count}"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
