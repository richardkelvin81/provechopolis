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
            delay: Duration(milliseconds: 250),
      child: Padding(
        padding: EdgeInsets.only(
          left: GlobalResponsive.bigDiference(context) - 7,
          right: GlobalResponsive.bigDiference(context) + 80),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: BackdropFilter(
            
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(90),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    maxRadius: GlobalResponsive.bigDiference(context),
                    backgroundColor: Color(0xFFF8C358),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: VideoTitulos(
                            video: videoPost,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
