
import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/0features/explorer/explorer_screen.dart';
import 'package:provechopolis/VIEW/0features/notify/notify_screen.dart';
import 'package:provechopolis/VIEW/0features/videos/screens/discover/discover_screen.dart';
import 'package:provechopolis/VIEW/videos/new_video_screen.dart';
import 'package:provechopolis/global_responsive.dart';

import '../user/user_screen.dart';

class HomePublicScreen extends StatefulWidget {
  @override
  HomePublicScreenState createState() => HomePublicScreenState();
}

class HomePublicScreenState extends State<HomePublicScreen> {
  var _page = 2;
  List<Widget> screens = [
    const ExplorerScreen(),
    const NewVideoScreen(),
    const DiscoverScreen(),
    const NotifyScreen(),
    const UserScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _page,
        children: screens,
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 20
          )]
        ),
        child: CurvedNavigationBar(
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              index: _page,
              height: GlobalResponsive.bigDiferenceBottomBar(context) + 28,
              items: [
                Icon(Icons.search_rounded, color: Colors.white, size: GlobalResponsive.bigDiferenceBottomBar(context)),
                Icon(Icons.favorite_rounded, color: Colors.white, size: GlobalResponsive.bigDiferenceBottomBar(context)),
                Icon(Icons.add_reaction_sharp, color: Colors.white, size: GlobalResponsive.bigDiferenceBottomBar(context)),
                Icon(Icons.notifications_active, color: Colors.white, size: GlobalResponsive.bigDiferenceBottomBar(context)),
                Icon(Icons.supervised_user_circle, color: Colors.white, size: GlobalResponsive.bigDiferenceBottomBar(context)),
              ],
              color: Colors.black54,
              buttonBackgroundColor: Colors.black54,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 500),
        
            ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}