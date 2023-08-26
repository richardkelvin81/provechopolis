import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/blur_title.dart';
import 'package:provechopolis/VIEW/domain/entities/video_post.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/video_buttons.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/video_titulos.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/video/full_screen_player.dart';
import 'package:provechopolis/global_responsive.dart';
import 'delivery_button.dart';

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
                child: FullScreenPlayer(
                  videoUrl: videoPost.videoUrl,
                ),
              ),
              /*WIDGETS DE LA PANTALLA DE REELS*/
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FadeIn(
                      delay: const Duration(
                        milliseconds: 1500,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: GlobalResponsive.bigDiference(context) - 11.5,
                            bottom: GlobalResponsive.bigDiference(context)),
                        child: const DeliveryButton(),
                      ),
                    ),
                  ),
                  BlurTitle(videoPost: videoPost),
                  SizedBox(height: GlobalResponsive.bigDiference(context) + 48),
                ],
              ),
               Positioned(
    bottom: 0,
    right: -30,
    child: AvatarGlow(
      animate: true,
      glowColor: Color.fromARGB(84, 255, 255, 255),
      endRadius: 120,
      duration: const Duration(milliseconds: 1400),
      repeat: true,
      showTwoGlows: true,
      curve: Curves.easeOutQuad,
      child: Swing(
            infinite: true,
            child: Container(
                width: GlobalResponsive.bigDiference(context) + 30,
                height: GlobalResponsive.bigDiference(context) + 30,
                decoration: BoxDecoration(
                    
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFDA746F),
                        Color.fromARGB(176, 218, 161, 111),
                      ]),
                    borderRadius: BorderRadius.circular(99)),
                child: Padding(
                  padding: EdgeInsets.all(
                      GlobalResponsive.mediumFont(context)),
                  child: const Image(
                    image: AssetImage('assets/logopp.png'),
                  ),
                )),
      ),
                        ),
                      ),
             
              ],
          );
        });
  }
}

class _ButtonTitle extends StatelessWidget {
  const _ButtonTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: FadeInUp(
              from: 45,
              duration: const Duration(milliseconds: 300),
              delay: const Duration(seconds: 1),
              child: Container(
                width: GlobalResponsive.bigDiference(context) + 185,
                height: GlobalResponsive.bigDiference(context) + 9,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 11.5, color: Color.fromARGB(64, 0, 0, 0))
                    ],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        GlobalResponsive.bigDiference(context) - 8.5
                      )
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFda6f79),
                          Color.fromARGB(255, 243, 175, 132),
                        ])),
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.food_bank_rounded,
                          color: Colors.white,
                          size: GlobalResponsive.smallFont(context) + 7),
                      SizedBox(width: GlobalResponsive.smallFont(context) - 1),
                      Text(
                        'Pedir Delivery',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize:
                                GlobalResponsive.smallFont(context) - 0.5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
