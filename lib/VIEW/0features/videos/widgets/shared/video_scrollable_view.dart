import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:ui';

import 'package:provechopolis/VIEW/0features/videos/widgets/shared/blur_title.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/buttons_reactions.dart';
import 'package:provechopolis/VIEW/domain/entities/video_post.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/video/full_screen_player.dart';
import 'package:provechopolis/global_responsive.dart';
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
                          return const Center(child: Text('Error al cargar el video.'));
                        }
                        if (!snapshot.hasData || snapshot.data == null) {
                          return const Center(child: Text('No se pudo cargar el video.'));
                        }
                        return FullScreenPlayer(
                          videoUrl: snapshot.data!.path,
                          );
                      } else {
                        return const Center(child: CircularProgressIndicator());
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
                    primerColumna(videoPost, context),
                    SizedBox(width: GlobalResponsive.bigDiference(context) - 7,),
                    segundaColumna(videoPost, context),
                    SizedBox(width: GlobalResponsive.bigDiference(context),),
                  ],
                ),
              ),
            ],
          );
        });
  }

  Expanded primerColumna(VideoPost videoPost, context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          //TopsBlurTitle(),
          Padding(
            padding: EdgeInsets.only(
              left: GlobalResponsive.bigDiference(context) - 7,),
            child: const _BotonPedirDelivery(
              bottom: 225,
              title: "Agregar al Carrito",
              subtitle: "Un restaurante a la vez",
            ),
          ),
          const SizedBox(height: 30),

          const SizedBox(height: 5),
          BlurTitle(videoPost: videoPost),
        ],
      ),
    );
  }

  Column segundaColumna(VideoPost videoPost, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ButtonsReactions(video: videoPost,),
        ],
      );
  }
}

class _BotonPedirDelivery extends StatelessWidget {

  final String title;
  final String subtitle;
  final double bottom;

  const _BotonPedirDelivery({
    super.key, 
    required this.title, 
    required this.subtitle, 
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius(context),
        boxShadow: const [BoxShadow(
          blurStyle: BlurStyle.outer,
          color: Color(0x4FFFFFFF),
          blurRadius: 13,
        )],
      ),
      child: ClipRRect(
        borderRadius: borderRadius(context),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3.5, sigmaY: 3.5,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: boxDecoration(context),
            child: MaterialButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.all(
                  GlobalResponsive.paddingText(context) - 2.5
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(title, style: TextStyle(
                      fontFamily: "Barlow Bold",
                      color: Colors.white,
                      fontSize: GlobalResponsive.smallFont(context) + 1.2
                    ),),
                    SizedBox(
                      height: GlobalResponsive.paddingText(context) - 10
                    ),
                    Text(subtitle, 
                      style: TextStyle(
                        fontFamily: "Barlow Medium",
                        color: Color(0x9FFFFFFF),
                        fontSize: GlobalResponsive.smallFont(context) - 3.5
                    ),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey
      ),
      color: Color.fromARGB(104, 0, 0, 0),
      borderRadius: borderRadius(context),
    );
  }

  BorderRadius borderRadius(BuildContext context) {
    return BorderRadius.circular(90);
  }
}
