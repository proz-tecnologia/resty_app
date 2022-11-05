// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../shared/models/post_model.dart';

class PostListTile extends StatelessWidget {
  final AsyncSnapshot<List<PostModel>> snapshot;
  final int index;
  final VoidCallback onTap;
  const PostListTile({
    Key? key,
    required this.snapshot,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
