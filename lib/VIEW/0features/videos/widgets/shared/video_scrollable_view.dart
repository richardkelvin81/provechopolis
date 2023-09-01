import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
                    segundaColumna(),
                    SizedBox(width: GlobalResponsive.bigDiference(context),),
                  ],
                ),
              ),
              Positioned(
                left: -30,
                bottom: GlobalResponsive.bigDiference(context) + 225,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      GlobalResponsive.smallFont(context) + 2
                    ),
                    boxShadow: const [BoxShadow(
                      blurStyle: BlurStyle.outer,
                      color: Color(0x4FFFFFFF),
                      blurRadius: 18,
                    )],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      GlobalResponsive.smallFont(context) + 2
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x55000000),
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        borderRadius: BorderRadius.circular(
                          GlobalResponsive.smallFont(context) + 2
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Pedir Delivery", style: TextStyle(
                                fontFamily: "Barlow Bold",
                                color: Colors.white,
                                fontSize: GlobalResponsive.smallFont(context)
                              ),),
                              Text("Pide Servicio a Domicilio,\n sin contratiempos", 
                                style: TextStyle(
                                  fontFamily: "Barlow Medium",
                                  color: Colors.white,
                                  fontSize: GlobalResponsive.smallFont(context) - 4
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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
                BlurTitle(videoPost: videoPost),
              ],
            ),
          );
  }

  Column segundaColumna() {
    return const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DeliveryButton(),
                    ],
                  );
  }
}
