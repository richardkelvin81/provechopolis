import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/blur_title.dart';
import 'package:provechopolis/global_responsive.dart';


class DeliveryButton extends StatelessWidget {
  const DeliveryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AvatarImage(),
        const AvatarImage(),
        const AvatarImage(),
        const AvatarImage(),
        const AvatarImage(),
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


class AvatarImage extends StatelessWidget {
  const AvatarImage();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        border: Border.all(
          width: 3.5,
          color: const Color(0xFFF8C358),)),
      child: Padding(
        padding: const EdgeInsets.all(3.5),
        child: CircleAvatar(
          radius: GlobalResponsive.bigDiference(context) + 4,
          backgroundColor: const Color(0xFFF8C358),
          backgroundImage: const AssetImage("assets/logopollo.jpeg"),
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