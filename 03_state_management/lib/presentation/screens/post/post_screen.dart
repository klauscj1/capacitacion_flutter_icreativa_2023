import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:state_management/domain/models/comment_model.dart';

import 'package:state_management/presentation/screens/post/controllers/post_controller.dart';

final postProvider = SimpleProvider((ref) => PostController());

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  void showDialogPost(BuildContext context, CommentModel commentModel) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(commentModel.description),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Aceptar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final post = postProvider.read.post;
    return Scaffold(
      appBar: AppBar(
        title: Text("Post - ${post.id}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Titulo",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(post.title),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Descripción",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(post.description),
            Consumer(
              builder: (context, ref, child) {
                final user = ref
                    .watch(postProvider.select((controller) => controller.user))
                    .user;
                if (user != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Usuario",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("${user.name} - ${user.username}"),
                      Text(user.email),
                    ],
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Cargando usuario....")
                      ],
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Comentarios",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Consumer(
              builder: (context, ref, child) {
                final comments = ref
                    .watch(postProvider
                        .select((controller) => controller.comments))
                    .comments;

                if (comments.isEmpty) {
                  return const Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text("Cargando los comentarios...")
                        ],
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        final comment = comments[index];
                        return ListTile(
                          onTap: () => showDialogPost(context, comment),
                          title: Text(comment.name),
                          subtitle: Text(comment.email),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
