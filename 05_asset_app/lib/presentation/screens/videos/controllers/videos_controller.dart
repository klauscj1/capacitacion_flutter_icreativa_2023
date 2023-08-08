import 'package:asset_app/config/helpers/video_local_list.dart';
import 'package:asset_app/domain/models/video_post.dart';
import 'package:asset_app/infrastructure/models/local_video_model.dart';
import 'package:flutter_meedu/meedu.dart';

class VideosController extends SimpleNotifier {
  bool isLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    final List<VideoPost> newVideosLocal = localVideos
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostModel())
        .toList();
    final newVideos = [...videos, ...newVideosLocal];
    videos = newVideos;
    isLoading = false;
    notify();
  }
}
