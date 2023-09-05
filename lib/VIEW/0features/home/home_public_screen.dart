
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provechopolis/VIEW/0features/explorer/explorer_screen.dart';
import 'package:provechopolis/VIEW/0features/favorites/favorites_screen.dart';
import 'package:provechopolis/VIEW/0features/notify/notify_screen.dart';
import 'package:provechopolis/VIEW/0features/user/user_screen.dart';
import 'package:provechopolis/VIEW/0features/videos/screens/discover/discover_screen.dart';
import 'package:provechopolis/VIEW/videos/new_video_screen.dart';
import 'package:provechopolis/global_responsive.dart';
import 'package:rive/rive.dart';

class HomePublicScreen extends StatefulWidget {
  // static const routeName = '/BottomNavBar';
  @override
  _HomePublicScreenState createState() => _HomePublicScreenState();
}

class _HomePublicScreenState extends State<HomePublicScreen> {
  int _page = 2;
  List<Widget> screens = [
    const ExplorerScreen(),
    const FavoritesScreen(),
    const DiscoverScreen(),
    const NotifyScreen(),
    const NewVideoScreen()
  ];
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print('Cambios del kevin creados');
    print('carpetas organizadas Kevin');
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: _page,
            children: screens
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  blurRadius: 12,
                )],
                color: const Color(0xFF283846),
                borderRadius: BorderRadius.circular(24)
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: RiveAnimation.asset(
                      'assets/icons.riv',
                      artboard: 'SEARCH',
                    ),
                  )
                ],)
            ),
          )
        ),
    );
  }
}