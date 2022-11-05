import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../shared/models/post_model.dart';

class PostListTile extends StatelessWidget {
  final AsyncSnapshot<List<PostModel>> snapshot;
  final int index;
  const PostListTile({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log("${snapshot.data?[index]}");
      },
      child: ListTile(
        leading: const Icon(Icons.newspaper),
        title: Text(snapshot.data?[index].title ?? "titulo padrão"),
        subtitle: Text(
          snapshot.data?[index].body ?? "subtitulo padrão",
          maxLines: 2,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
