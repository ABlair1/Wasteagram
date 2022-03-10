import 'package:flutter/material.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'package:wasteagram/screens/post_detail_screen.dart';
import 'package:wasteagram/screens/post_list_screen.dart';

class App extends StatefulWidget {

  static const String appTitle = 'Wasteagram';
  // static final routes = {
  //   PostListScreen.routeName: (context) => const PostListScreen(),
  //   PostDetailScreen.routeName: (context) => const PostDetailScreen(),
  //   NewPostScreen.routeName: (context) => const NewPostScreen(),
  // };

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
      // routes: App.routes,
      // initialRoute: PostListScreen.routeName,
    );
  }
}