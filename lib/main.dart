import 'package:flutter/material.dart';
import 'package:resty_app/src/features/posts/all_posts/posts_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostsPage(),
    );
  }
}
