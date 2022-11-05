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
  //TODO: acessar https://gorest.co.in/,
  //criar uma conta,
  //pegar o seu token
  //e substituir abaixo
  //https://youtu.be/ercyQ1d3NAA?t=962

  final _headers = {
    "Authorization":
        "Bearer a07cd3e92e3b2bfe6182f5b973cff1be4c829d29f184f02fdcda0d12504623da",
    "Content-Type": "application/json"
  };

  @override
  Future<void> createPost(PostModel post) async {
    log("método de criar post é chamado pelo controller");
    try {
      final response = await _http.post(
        Uri.parse("https://gorest.co.in/public/v2/users/${post.userId}/posts"),
        headers: _headers,
        body: post.toJson(),
      );
      if (response.statusCode == 201) {
        log("conclui requisição de criação de post com sucesso");
        log(response.body);
      } else {
        log("lança exceção em caso de problema na requisição");
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    log("método de pegar todos os posts é chamado pelo controller");
    try {
      final response = await _http.get(
        Uri.parse("https://gorest.co.in/public/v2/users/3817/posts"),
        headers: _headers,
      );
      if (response.statusCode == 200) {
        log("conclui requisição com sucesso e inicia tratamento de dados vindos da api");
        final decodedList =
            List<Map<String, dynamic>>.from(jsonDecode(response.body));

        final postsList = decodedList.map((e) => PostModel.fromMap(e)).toList();

        log("tratamentos feitos e retorna lista de posts para o controller");
        return postsList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
