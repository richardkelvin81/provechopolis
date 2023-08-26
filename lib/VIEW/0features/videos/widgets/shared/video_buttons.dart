import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/domain/entities/video_post.dart';
import 'package:provechopolis/global_responsive.dart';

import '../../../../../CONFIG/helpers/human_formats.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          FlipInX(
            delay: const Duration(milliseconds: 1500),
            duration: const Duration(milliseconds: 900),
            child: _CustomIconButton(
              color: Colors.orange,
              value: video.likes,
              icon: Icons.favorite,
            ),
          ),
          SizedBox(width: GlobalResponsive.smallFont(context) - 4,),
          FlipInX(
            delay: const Duration(milliseconds: 1800),
            duration: const Duration(milliseconds: 900),
            child: _CustomIconButton(
              color: Colors.white54,
              value: video.views,
              icon: Icons.comment,
            ),
          ),
          SizedBox(width: GlobalResponsive.smallFont(context) - 4,),
          FlipInX(
            delay: const Duration(milliseconds: 2100),
            duration: const Duration(milliseconds: 900),
            child: _CustomIconButton(
              color: Colors.orange,
              value: video.views,
              icon: Icons.share,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {

  final int value;
  final IconData icon;
  final Color color;

  const _CustomIconButton({
    required this.value, 
    required this.icon, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [ BoxShadow(
          color: Colors.white24,
          blurRadius: 15,
        ) ],
        borderRadius: BorderRadius.circular(19),
        color: Colors.black54,
        border: Border.all(
          color: Colors.white54
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(GlobalResponsive.smallFont(context) - 3.5),
        child: Row(
          children: [
            Icon(icon, size: GlobalResponsive.smallFont(context) - 2.5, color: Colors.white,),
            SizedBox(width: GlobalResponsive.smallFont(context) - 7.5,),
            Text(HumanFormats.humanReadableNumber(value.toDouble()), style: TextStyle(
              fontSize: GlobalResponsive.smallFont(context) - 2,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),),
          ],
        ),
      ),
    );
  }
}