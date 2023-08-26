import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';

class Video {

      final String id;
      final String uid;
      final String userpic;
      final String thumbnail;
      final String songname;
      final Timestamp fecharegistro;
      final String titulo;
      final String estado;
      final String url;
      final  int    views;
      final  int    likes;
      final  int    sharecount;
      final String comments;
      final String restaurant;
      VideoPlayerController? controller;

  Video({

      required this.id,
      required this.uid,
      required this.userpic,
      required this.songname,
      required this.fecharegistro,
      required this.titulo, 
      required this.estado, 
      required this.url, 
      required this.comments, 
      required this.thumbnail,
      required this.sharecount,
      required this.restaurant,
      this.views = 0,
      this.likes = 0,
     
 

});


 Future<void> loadController() async {
    controller = VideoPlayerController.networkUrl(Uri(path: url));
    await controller?.initialize();
    controller?.setLooping(true);
  }


}