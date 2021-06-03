import 'package:flutter/material.dart';
import 'package:notify_with_google/ui/components/toast.dart';
import 'package:notify_with_google/ui/pages/iziPayPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: IziPay(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text("Imgae with message Toast"),
              onTap: () {
                ToastUtil.show(
                    ToastDecorator(
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Icon(Icons.album, size: 50),
                            title: Text('Heart Shaker',
                                style: TextStyle(color: Colors.white)),
                            subtitle: Text('TWICE',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.greenAccent,
                    ),
                    context,
                    gravity: ToastGravity.top);
              },
            ),
          ],
        ),
      ),
    );
  }
}
