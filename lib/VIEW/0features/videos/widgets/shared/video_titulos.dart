import 'package:flutter/material.dart';

import 'package:marquee_widget/marquee_widget.dart';
import '../../../../domain/entities/video_post.dart';
import '../../../../../global_responsive.dart';

class VideoTitulos extends StatelessWidget {
  final VideoPost video;

  const VideoTitulos({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: GlobalResponsive.smallFont(context) + 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            "${video.description} - Ver Detalles",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: GlobalResponsive.verySmallFont(context) - 1),
          ),
          const SizedBox(height: 1.2),
          Marquee(
            backDuration: const Duration(milliseconds: 2000),
            backwardAnimation: Curves.slowMiddle,
            direction: Axis.horizontal,
            child: Text(
              video.caption,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Barlow Bold',
                  color: Colors.white,
                  fontSize: GlobalResponsive.smallFont(context) + 2),
              ),
          ),
          
        ],
      ),
    );
  }
}
