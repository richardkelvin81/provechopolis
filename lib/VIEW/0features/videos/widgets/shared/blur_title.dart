import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/video_titulos.dart';
import 'package:provechopolis/VIEW/domain/entities/video_post.dart';
import 'package:provechopolis/global_responsive.dart';

class BlurTitle extends StatelessWidget {
  const BlurTitle({
    super.key,
    required this.videoPost,
  });

  final VideoPost videoPost;

  @override
  Widget build(BuildContext context) {
    return FlipInY(
            delay: const Duration(milliseconds: 250),
      child: Padding(
        padding: EdgeInsets.only(
          left: GlobalResponsive.bigDiference(context) ,),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            boxShadow: [ BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Colors.white.withOpacity(0.22),
              blurRadius: 24,
            )],
          ),
          child: containerBlur(context),
        ),
      ),
    );
  }

  /* CODIGO DEL CONTENEDOR DIFUMINADO DEL AVATAR Y DEL TITULO DEL RESTAURANTE */
  Container containerBlur(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x39000000),
        borderRadius: BorderRadius.circular(90),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AvatarImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.5),
              child: VideoTitulos(
                video: videoPost,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  const AvatarImage();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        border: Border.all(
          width: GlobalResponsive.paddingText(context) - 10.5,
          color: const Color(0xFFF8C358),)),
      child: Padding(
        padding: EdgeInsets.all(
          GlobalResponsive.paddingText(context) - 10.5,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: GlobalResponsive.bigDiference(context) + 4,
              backgroundColor: const Color(0xFFF8C358),
              backgroundImage: const AssetImage("assets/logopollo.jpeg"),
            ),
            Positioned(
              bottom: -8,
              child: Row(
                children: [
                  rowStars(context),
                  rowStars(context),
                  rowStars(context),
                  rowStars(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding rowStars(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: GlobalResponsive.paddingText(context) - 11,
            ),
            child: SizedBox(
              width: GlobalResponsive.smallFont(context) + 2,
              child: const Image(image: AssetImage("assets/favorito.png"))),
    );
  }
}
