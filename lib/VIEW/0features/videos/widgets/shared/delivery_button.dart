import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provechopolis/global_responsive.dart';


class DeliveryButton extends StatelessWidget {
  const DeliveryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.all(GlobalResponsive.smallFont(context) - 6,),
          decoration: const BoxDecoration(
            color: Color.fromARGB(92, 0, 0, 0),
            borderRadius: BorderRadius.all(
              Radius.circular(100)
            ),
          ),
          child: Column(
            children: [
              FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: const IconAnimated(icon: Icons.favorite_rounded,)),
              FadeInUp(
                delay: const Duration(milliseconds: 650),
                child: const IconAnimated(icon: Icons.comment,)),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: const IconAnimated(icon: Icons.share,)),
            ],
          ),
        ),
      ),
    );
  }
}

class IconAnimated extends StatelessWidget {

  final IconData icon;

  const IconAnimated({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: GlobalResponsive.smallFont(context) - 7,
        vertical: GlobalResponsive.smallFont(context) - 6,
      ),
      child: Swing(
        infinite: true,
        child: Container(
          height: GlobalResponsive.bigDiference(context) * 1.75,
          width: GlobalResponsive.bigDiference(context) * 1.75,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.black54, 
              borderRadius: BorderRadius.circular(99)),
          child: Icon(
            icon, 
            size: GlobalResponsive.bigDiference(context) - 9, 
            color: Colors.white)
        ),
      ),
    );
  }
}
