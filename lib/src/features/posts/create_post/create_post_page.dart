import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:resty_app/src/features/posts/posts_controller.dart';
import 'package:resty_app/src/features/posts/posts_repository.dart';
import 'package:resty_app/src/shared/models/post_model.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final homeController = PostsController(PostRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: titleController,
            onChanged: (_) => log(titleController.text),
          ),
          TextField(
            controller: bodyController,
          ),
          ElevatedButton(
            onPressed: () async {
              log("botão pressionado");
              await homeController.createPost(
                PostModel(
                  userId: 3817,
                  title: titleController.text,
                  body: bodyController.text,
                ),
              );
            },
            child: const Text("Publicar Post"),
          )
        ],
      ),
    );
  }
}
