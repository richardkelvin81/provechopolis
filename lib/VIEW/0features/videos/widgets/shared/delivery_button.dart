import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/number_likes.dart';
import 'package:provechopolis/global_responsive.dart';

class DeliveryButton extends StatelessWidget {
  const DeliveryButton({super.key});

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
          child: const _ButtonReactions(
            icon: Icons.favorite_border_outlined,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: const _ButtonReactions(
             icon: Icons.insert_comment_outlined,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: const _ButtonReactions(
             icon: Icons.share_outlined,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 1000),
          child: const _ButtonPP(
            path: "assets/logopp.png",
            paddingAll: 13,
          ),
        ),
      ],
    );
  }
}


class _ButtonReactions extends StatelessWidget {

  final IconData icon;
  const _ButtonReactions({required this.icon});

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
            CircleAvatar(
              radius: GlobalResponsive.bigDiference(context) + 7,
              backgroundColor: Color(0x29000000),
              child: Icon(icon, color: Colors.white),
            ),
            const NumberLikes(),
            
          ],
        ),
      ),
    );
  }
}


class _ButtonPP extends StatelessWidget {

  final String path;
  final double paddingAll;
  const _ButtonPP({required this.path, required this.paddingAll});


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
        child: Stack(
          children: [
            CircleAvatar(
              radius: GlobalResponsive.bigDiference(context) + 7,
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(paddingAll),
                child: Image(
                  image: AssetImage(path),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
