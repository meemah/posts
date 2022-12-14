import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:posts/model/post_model.dart';

class DetailView extends StatelessWidget {
  final PostModel postModel;
  const DetailView({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${postModel.id ?? ""}"),
              Text(postModel.body ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
