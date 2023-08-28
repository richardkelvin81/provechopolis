import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
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
          child: const _ButtonReactions()),
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: const _ButtonReactions()),
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: const _ButtonReactions()),
        FadeInUp(
          delay: const Duration(milliseconds: 1000),
          child: _ButtonPP(
            path: "assets/logopp.png",
            paddingAll: GlobalResponsive.mediumFont(context),
          ),
        ),
        /*FadeInUp(
          delay: const Duration(milliseconds: 500),
          child: const IconAnimated(icon: Icons.favorite_rounded,)),
        FadeInUp(
          delay: const Duration(milliseconds: 650),
          child: const IconAnimated(icon: Icons.comment,)),
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: const IconAnimated(icon: Icons.share,)),
        const _ButtonPP(),*/
          
      ],
    );
  }
}


class _ButtonReactions extends StatelessWidget {
  const _ButtonReactions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: GlobalResponsive.smallFont(context) - 6
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          border: Border.all(
            width: 1,
            color: Colors.white,)),
        child: CircleAvatar(
          radius: GlobalResponsive.bigDiference(context) + 7,
          backgroundColor: Colors.black87,
          child: const Icon(Icons.favorite_sharp, color: Colors.white),
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
        top: GlobalResponsive.smallFont(context) - 6
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF8C358),
              Color.fromARGB(255, 240, 150, 76),
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
