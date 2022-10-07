import 'package:flutter/material.dart';
import 'package:post_app_finaly/config/theme/theme.dart';
import 'package:post_app_finaly/features/posts/prisintaion/posts_screen/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home:const PostsScreen()
    );
  }
}
