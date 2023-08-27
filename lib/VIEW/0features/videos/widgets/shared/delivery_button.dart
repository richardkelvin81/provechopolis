import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provechopolis/global_responsive.dart';


class DeliveryButton extends StatelessWidget {
  const DeliveryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ButtonReactions(),
        _ButtonReactions(),
        _ButtonReactions(),
        _ButtonPP(
          path: "assets/logopp.png"
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
          radius: GlobalResponsive.bigDiference(context) + 7.5,
          backgroundColor: Colors.black87,
          child: const Icon(Icons.favorite_sharp, color: Colors.white),
        ),
      ),
    );
  }
}


class _ButtonPP extends StatelessWidget {

  final String path;
  const _ButtonPP({super.key, required this.path});


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
          radius: GlobalResponsive.bigDiference(context) + 7.5,
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(
                GlobalResponsive.mediumFont(context)),
            child: Image(
              image: AssetImage(path),
            ),
          )
        ),
      ),
    );
  }
}
