// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:resty_app/src/features/posts/create_post/create_post_page.dart';
import 'package:resty_app/src/features/posts/single_post/single_post_page.dart';

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
  void initState() {
    super.initState();
    log("primeiro método ao construir a tela pela primeira vez");
  }

  @override
  Widget build(BuildContext context) {
    log("espera future terminar");
    return Scaffold(
      body: FutureBuilder(
        future: postsController.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isEmpty) {
            log("future termina com dados, mas lista está vazia");
            return const Center(
              child: Text(
                  "Não há posts cadastrados\n\nVerifique o seu token ou cadastre novos posts\n\nLeia os TODO na aba de Problemas do VS Code"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            log("future termina com dados e lista contém posts");
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return PostListTile(
                  index: index,
                  snapshot: snapshot,
                  onTap: () {
                    log("chama navegação para tela de post individual");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        settings: RouteSettings(
                          name: "/posts/${snapshot.data?[index].id}",
                          arguments: snapshot.data?[index],
                        ),
                        builder: (context) => SinglePostPage(
                          postModel: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          log("tela em modo de carregamento enquanto espera future concluir");
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          log("navega para tela de novo post");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePostPage(),
            ),
          );
        },
        icon: const Icon(Icons.edit_note_rounded),
        label: const Text("Novo Post"),
      ),
    );
  }
}
