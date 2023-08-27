import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provechopolis/global_responsive.dart';


class DeliveryButton extends StatelessWidget {
  const DeliveryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const _ButtonPP(),
          
      ],
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


class _ButtonPP extends StatelessWidget {
  const _ButtonPP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Swing(
      infinite: true,
      child: Container(
        width: GlobalResponsive.bigDiference(context) + 30,
        height: GlobalResponsive.bigDiference(context) + 30,
        decoration: BoxDecoration(
            
            gradient: const LinearGradient(
              colors: [
                Color(0xFFF8C358),
                Color(0xFFFAAB48),
                
              ]),
            borderRadius: BorderRadius.circular(99)),
        child: Padding(
          padding: EdgeInsets.all(
              GlobalResponsive.mediumFont(context)),
          child: const Image(
            image: AssetImage('assets/logopp.png'),
          ),
        )),
       );
  }
}