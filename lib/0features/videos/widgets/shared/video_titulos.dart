import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/video_post.dart';
import '../../../../global_responsive.dart';

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
        horizontal: GlobalResponsive.smallFont(context) + 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: GlobalResponsive.smallFont(context) - 2.85),
          ),
          SizedBox(height: GlobalResponsive.smallFont(context) - 9.2),
          Text(
            video.caption,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Barlow Bold',
                color: Colors.white,
                fontSize: GlobalResponsive.smallFont(context) + 2.85),
          ),
        ],
      ),
    );
  }
}
