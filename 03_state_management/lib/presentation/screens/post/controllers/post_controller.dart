import 'package:flutter_meedu/meedu.dart';
import 'package:state_management/domain/models/comment_model.dart';
import 'package:state_management/domain/models/post_model.dart';
import 'package:state_management/domain/models/user_model.dart';
import 'package:state_management/infrastructure/datasources/posts_placeholder_datasource.dart';

class PostController extends SimpleNotifier {
  late Post post;
  User? user;
  List<CommentModel> comments = [];

  void setPost(Post post) {
    comments = [];
    user = null;
    this.post = post;
    loadCommets();
    loadUser();
  }

  void loadCommets() async {
    await Future.delayed(const Duration(seconds: 2));
    comments = await PostPlaceHolderDatasource().loadCommentsByPost(post.id);
    notify();
  }

  void loadUser() async {
    await Future.delayed(const Duration(seconds: 2));
    user = await PostPlaceHolderDatasource().loadUserPost(post.userId);
    notify();
  }
}
