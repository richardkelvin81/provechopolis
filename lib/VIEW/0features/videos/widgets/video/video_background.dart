import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  const VideoBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x9D000000),
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Color(0x9D000000),
            ],
          )
        )
      )
    );
  }
}