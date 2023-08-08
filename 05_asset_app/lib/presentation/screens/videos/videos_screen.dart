import 'package:asset_app/domain/models/video_post.dart';
import 'package:asset_app/presentation/screens/videos/controllers/videos_controller.dart';
import 'package:asset_app/presentation/widgets/full_screen_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

final videosProvider =
    SimpleProvider<VideosController>((ref) => VideosController());

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final controller = ref.watch(videosProvider);

          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                )
              : PageView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.videos.length,
                  itemBuilder: (context, index) {
                    final VideoPost videoPost = controller.videos[index];
                    return Stack(
                      children: [
                        SizedBox.expand(
                          child: FullScreenPlayer(
                            caption: videoPost.caption,
                            videoUrl: videoPost.videoUrl,
                          ),
                        )
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
