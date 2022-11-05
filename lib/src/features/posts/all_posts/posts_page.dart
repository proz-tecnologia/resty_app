// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../posts_controller.dart';
import '../posts_repository.dart';
import '../widgets/post_list_tile.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final postsController = PostsController(PostRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: postsController.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                  "não há posts cadastrados\nverifique o seu token ou cadastre novos posts"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return PostListTile(
                  index: index,
                  snapshot: snapshot,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
