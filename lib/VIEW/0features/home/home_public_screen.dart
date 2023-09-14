
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
  int currentTab = 0;
  
  List<Widget> screens = [
    const DiscoverScreen(),
    const NewVideoScreen(),
    const ExplorerScreen(),
    const UserScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final _size = GlobalResponsive.bigDiferenceBottomBar(context) - 4;
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            blurStyle: BlurStyle.outer,
            color: Colors.white.withOpacity(0.45),
            blurRadius: 1
          )]
        ),
        child: BottomAppBar(
                elevation: 0, 
                color: currentTab == 0
                  ? Colors.transparent
                  : Colors.white,
                  
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonNavigation(
                        _size, 0, Icons.home_outlined
                      ),
                      buttonNavigation(
                        _size, 1, Icons.dashboard,
                      ), 



                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7.2
                          ),  
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFF8C358),
                                Color(0xFFFBAF3C),
                              ]
                            )
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'crear');
                            },
                            child: Padding(   
                              padding: EdgeInsets.symmetric(
                                horizontal: GlobalResponsive.smallFont(context) - 4.5,
                                vertical: GlobalResponsive.smallFont(context) - 6.5,
                              ),
                              child: Row(
                                children: [
                                  Text('Crear', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: GlobalResponsive.smallFont(context) + 3,
                                    fontFamily: 'Barlow Black',
                                  ),),
                                  const SizedBox(width: 3),
                                  Icon(
                                    Icons.add_a_photo, 
                                    color: Colors.white,
                                    size: GlobalResponsive.smallFont(context) + 4,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),



                      buttonNavigation(
                        _size, 2, Icons.search_outlined,
                      ), 
                      buttonNavigation(
                        _size, 3, Icons.supervised_user_circle_sharp,
                      ), 
                    ]),
              )
      ),
    );
  }

  Expanded buttonNavigation(
      double _size,
      number,
      icon,
    ) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90)
        ),
        child: MaterialButton(
          splashColor: Color.fromARGB(117, 248, 195, 88),
          highlightColor: Colors.transparent,
          minWidth: 0,
          onPressed: () {
              setState(() {
                currentTab = number;
              });
            },
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10, 
              ),
              child: Icon(
                icon,
                size: _size,
                color: currentTab == number
                    ? activeColor()
                    : inactiveColor(),
              ),
            ),
        ),
      ),
    );
  }
  Color inactiveColor() => Colors.grey;

  Color activeColor() => const Color(0xFFFCB244);
}