import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:provechopolis/global_responsive.dart';


 void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Dialog Title'),
          content: Text('This is the content of the dialog.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }




class DeliveryButton extends StatelessWidget {
  const DeliveryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: const _ButtonPP(
            path: "assets/favorito.png",
            paddingAll: 0,
          ),
        ),
        FadeInUp(
          delay: const Duration(milliseconds: 400),
          child: const _ButtonReactions(
            icon: Icons.favorite_border_outlined,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: const _ButtonReactions(
             icon: Icons.insert_comment_outlined,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: const _ButtonReactions(
             icon: Icons.share_outlined,
          )),
        FadeInUp(
          delay: const Duration(milliseconds: 1000),
          child: _ButtonPP(
            path: "assets/logopp.png",
            paddingAll: GlobalResponsive.mediumFont(context),
          ),
        ),
      ],
    );
  }
}


class _ButtonReactions extends StatelessWidget {

  final IconData icon;
  const _ButtonReactions({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: GlobalResponsive.smallFont(context) + 5
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          border: Border.all(
            width: 1,
            color: Colors.white,)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: GlobalResponsive.bigDiference(context) + 7,
              backgroundColor: const Color(0x56000000),
              child: Icon(icon, color: Colors.white),
            ),
            Positioned(
              bottom: -10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: [ BoxShadow(
                    blurRadius: 20,
                    color: Colors.white.withOpacity(0.3)
                  ) ],
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4, sigmaY: 4,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white
                        ),
                        
                        borderRadius: BorderRadius.circular(90),
                        color: const Color(0x62000000),
                      ),
                      child: const Text('12 K', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Barlow Bold',
                        fontSize: 11
                      ),),
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}


class _ButtonPP extends StatelessWidget {

  final String path;
  final double paddingAll;
  const _ButtonPP({required this.path, required this.paddingAll});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: GlobalResponsive.smallFont(context) + 5
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF8C358),
              Color(0xFFF0964C),
            ]),
          boxShadow: [BoxShadow(
            blurRadius: 15,
            color: Colors.white.withOpacity(0.2)

          )]
        ),
        child: CircleAvatar(
          radius: GlobalResponsive.bigDiference(context) + 7,
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(paddingAll),
            child: Image(
              image: AssetImage(path),
            ),
          )
        ),
      ),
    );
  }
}
