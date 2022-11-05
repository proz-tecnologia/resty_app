import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:resty_app/src/shared/models/post_model.dart';

abstract class IPostRepository {
  Future<void> createPost(PostModel post);
  Future<List<PostModel>> getAllPosts();
}

class PostRepository implements IPostRepository {
  final _http = Client();
  final _headers = {
    "Authorization":
        "Bearer a07cd3e92e3b2bfe6182f5b973cff1be4c829d29f184f02fdcda0d12504623da",
    "Content-Type": "application/json"
  };

  @override
  Future<void> createPost(PostModel post) async {
    try {
      final response = await _http.post(
        Uri.parse("https://gorest.co.in/public/v2/users/${post.userId}/posts"),
        headers: _headers,
        body: post.toJson(),
      );
      if (response.statusCode == 201) {
        log(response.body);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await _http.get(
        Uri.parse("https://gorest.co.in/public/v2/users/3817/posts"),
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final decodedList =
            List<Map<String, dynamic>>.from(jsonDecode(response.body));

        final postsList = decodedList.map((e) => PostModel.fromMap(e)).toList();

        return postsList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
