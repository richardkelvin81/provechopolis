import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../global_responsive.dart';

class NumberLikes extends StatelessWidget {
  final int reactions;
  const NumberLikes({
    super.key, required this.reactions,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -10,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4, sigmaY: 4,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: GlobalResponsive.verySmallFont(context),
              vertical: 2.5
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white
              ),
              borderRadius: BorderRadius.circular(90),
              color: const Color(0x62000000),
            ),
            child: Text("$reactions", style: TextStyle(
              color: Colors.white,
              fontFamily: 'Barlow Bold',
              fontSize: GlobalResponsive.verySmallFont(context) + 1
            ),),
          ),
        ),
      ),
    );
  }
}