import 'package:resty_app/src/features/posts/posts_repository.dart';
import 'package:resty_app/src/shared/models/post_model.dart';

class PostsController {
  final IPostRepository postsRepository;

  PostsController(this.postsRepository);

  Future<void> createPost(PostModel post) async {
    try {
      await postsRepository.createPost(post);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PostModel>> getAllPosts() async {
    try {
      final result = await postsRepository.getAllPosts();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
