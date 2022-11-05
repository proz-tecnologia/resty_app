import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:resty_app/src/shared/models/post_model.dart';

class SinglePostPage extends StatelessWidget {
  final PostModel postModel;
  const SinglePostPage({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    final routeSettings = ModalRoute.of(context)?.settings;
    log(routeSettings?.name ?? "nulo");
    log(routeSettings?.arguments.toString() ?? "nulo");
    return Scaffold(
      body: Column(
        children: [
          Text(postModel.title),
          Text(postModel.body),
        ],
      ),
    );
  }
}
