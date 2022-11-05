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
              log("botão de criar novo post pressionado");

              await homeController.createPost(
                PostModel(
                  userId:
                      0000, //TODO: altere o id para o seu usuario criado na API
                  title: titleController.text,
                  body: bodyController.text,
                ),
              );
              if (mounted) {
                log("navega para a primeira tela na pilha de navegação");
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
            child: const Text("Publicar Post"),
          )
        ],
      ),
    );
  }
}
