import 'dart:developer';

import 'package:resty_app/src/features/posts/posts_repository.dart';
import 'package:resty_app/src/shared/models/post_model.dart';

class PostsController {
  final IPostRepository postsRepository;

  PostsController(this.postsRepository);

  Future<void> createPost(PostModel post) async {
    log("método de criar post é chamado pela tela");
    try {
      await postsRepository.createPost(post);
      log("método de criação de post concluído no repository");
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PostModel>> getAllPosts() async {
    log("método para pegar todos os posts é chamado pela tela");
    try {
      final result = await postsRepository.getAllPosts();
      log("lista de posts retornado pelo repository");
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
