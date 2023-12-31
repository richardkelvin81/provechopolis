import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/number_likes.dart';
import 'package:provechopolis/VIEW/domain/entities/video_post.dart';
import 'package:provechopolis/global_responsive.dart';

class ButtonsReactions extends StatelessWidget {
  const ButtonsReactions({
    super.key, 
    required this.video, 
  });

  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: const _ButtonPP(
            path: "assets/favorito.png",
            paddingAll: 0,
          ),
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 400),
          child: _ButtonReactions(
            context: context,
            icon: Icons.favorite_border_outlined, 
            numberReactions: video.likes,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: _ButtonReactions(
            context: context,
             icon: Icons.insert_comment_outlined, 
             numberReactions: video.views,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: _ButtonReactions(
            context: context,
             icon: Icons.share_outlined,
             numberReactions: video.likes,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 1000),
          child: const _ButtonPP(
            path: "assets/logopp.png",
            paddingAll: 19.5,
          ),
          
        ),
      ],
    );
  }
}


class _ButtonReactions extends StatelessWidget {

 
  const _ButtonReactions({
    required this.icon,  
    required BuildContext context, 
    required this.numberReactions
  });

  final IconData icon;
  final int numberReactions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: GlobalResponsive.smallFont(context) + 7.5
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          border: Border.all(
            width: 1,
            color: Colors.white,)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3.5, sigmaY: 3.5
                ),
                child: CircleAvatar(
                  radius: GlobalResponsive.bigDiference(context) + 7,
                  backgroundColor: Color(0x51000000),
                  child: Icon(icon, color: Colors.white),
                ),
              ),
            ),
            NumberLikes(
              reactions: numberReactions
            ),
            
          ],
        ),
      ),
    );
  }
}


class _ButtonPP extends StatelessWidget {

  final String path;
  final double paddingAll;
  const _ButtonPP({
    required this.path, 
    required this.paddingAll, 
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: GlobalResponsive.smallFont(context) + 5
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF8C358),
              Color(0xFFF0964C),
            ]),
          boxShadow: [BoxShadow(
            blurRadius: 15,
            color: Colors.white.withOpacity(0.2)

          )]
        ),
        child: CircleAvatar(
          radius: GlobalResponsive.bigDiference(context) + 7,
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(paddingAll),
            child: Image(
              image: AssetImage(path),
            ),
          )
        ),
      ),
    );
  }
}
