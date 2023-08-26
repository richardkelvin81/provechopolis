
import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';


class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;

  const FullScreenPlayer({super.key, required this.videoUrl});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}
class _FullScreenPlayerState extends State<FullScreenPlayer> {
  
  late VideoPlayerController controller;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }
  

  @override
  void dispose() {
    controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(
            color: Color(0xFFDA746F),
          ),);
        }
        return Stack(
          fit: StackFit.expand,
          children: [

            SizedBox.expand(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio, 
                child: VideoPlayer(controller)
              ),
            ),

            const VideoBackground(),
            
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  if(controller.value.isPlaying) {
                    controller.pause();
                    return;
                  }
                  controller.play();
                },),
            ),
          ],
        );
      },
    );
  } 
}
