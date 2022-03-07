import 'package:flutter/material.dart';

class App extends StatefulWidget {

  final String appTitle = 'Wasteagram';

  const App({ Key? key }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.appTitle,
      home: Scaffold(appBar: AppBar(title: Text('Placeholder'),), body: Center(),)
    );
  }
}