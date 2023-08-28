
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provechopolis/VIEW/0features/explorer/explorer_screen.dart';
import 'package:provechopolis/VIEW/0features/favorites/favorites_screen.dart';
import 'package:provechopolis/VIEW/0features/notify/notify_screen.dart';
import 'package:provechopolis/VIEW/0features/user/user_screen.dart';
import 'package:provechopolis/VIEW/0features/videos/screens/discover/discover_screen.dart';
import 'package:provechopolis/VIEW/videos/new_video_screen.dart';
import 'package:provechopolis/global_responsive.dart';

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
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
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
}