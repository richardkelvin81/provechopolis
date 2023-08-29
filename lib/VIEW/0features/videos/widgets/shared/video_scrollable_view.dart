import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provechopolis/VIEW/0features/videos/widgets/shared/blur_title.dart';
import 'package:provechopolis/VIEW/domain/entities/video_post.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/video/full_screen_player.dart';
import 'package:provechopolis/global_responsive.dart';
import 'delivery_button.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final videoPost = videos[index];
          return Stack(
            children: [
              SizedBox.expand(
                child: FutureBuilder<File>(
                    future: DefaultCacheManager().getSingleFile(videoPost.videoUrl),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text('Error al cargar el video.'));
                        }
                        if (!snapshot.hasData || snapshot.data == null) {
                          return Center(child: Text('No se pudo cargar el video.'));
                        }
                        return FullScreenPlayer(
                          videoUrl: snapshot.data!.path,
                          );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
              ),
              /* INSTRUCTIVA DE WIDGETS DE LA PANTALLA DE REELS */
              // DESDE ESTE PUNTO SE CONFORMAN DOS COLUMNAS EN UNA FILA
              // LA PRIMER COLUMNA SON LOS ELEMENTOS DE LA IZQUIERDA
              // LA SEGUNDA COLUMNA SON LOS ELEMENTOS DE LA DERECHA, LOS BOTONES PARA REACCIONAR A LOS VIDEOS
              Padding(
                padding: EdgeInsets.only(
                  bottom: GlobalResponsive.bigDiference(context) + 48
                ),
                child: Row(
                  children: [
                    primerColumna(videoPost),
                    SizedBox(width: GlobalResponsive.bigDiference(context) - 7,),
                    segundaColumna(),
                    SizedBox(width: GlobalResponsive.bigDiference(context),),
                  ],
                ),
              ),
               
              ],
          );
        });
  }


  Expanded primerColumna(VideoPost videoPost) {
    return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                //TopsBlurTitle(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4,
                      sigmaY: 4,
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.social_distance),
                            SizedBox(width: 6,),
                            Text("Seguir a este restaurante"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                BlurTitle(videoPost: videoPost),
              ],
            ),
          );
  }

  Column segundaColumna() {
    return  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DeliveryButton(),
                    ],
                  );
  }
}
