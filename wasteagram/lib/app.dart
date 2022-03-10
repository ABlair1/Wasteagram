import 'package:flutter/material.dart';
import 'package:wasteagram/screens/post_list_screen.dart';

class App extends StatefulWidget {

  static const String appTitle = 'Wasteagram';

  const App({ Key? key }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: App.appTitle,
      home: PostListScreen(),
    );
  }
}