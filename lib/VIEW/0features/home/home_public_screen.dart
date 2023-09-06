
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/0features/explorer/explorer_screen.dart';
import 'package:provechopolis/VIEW/0features/notify/notify_screen.dart';
import 'package:provechopolis/VIEW/0features/videos/screens/discover/discover_screen.dart';
import 'package:provechopolis/VIEW/videos/new_video_screen.dart';

class HomePublicScreen extends StatefulWidget {
  @override
  HomePublicScreenState createState() => HomePublicScreenState();
}

class HomePublicScreenState extends State<HomePublicScreen> {
  var currentIndex = 0;
  List<Widget> screens = [
    const DiscoverScreen(),
    const ExplorerScreen(),
    const NotifyScreen(),
    const NewVideoScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(.15),
                blurRadius: 10,
                blurStyle: BlurStyle.outer
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5, sigmaY: 5
              ),
              child: Container(
                height: size.width * .140,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(88, 0, 0, 0),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: size.width * .020),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(
                        () {
                          currentIndex = index;
                        },
                      );
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          margin: EdgeInsets.only(
                            bottom: index == currentIndex ? 0 : size.width * .036,
                            right: size.width * .047,
                            left: size.width * .047,
                          ),
                          width: size.width * .115,
                          height: index == currentIndex ? size.width * .0116 : 0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF8C358),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            ),
                          ),
                        ),
                        Icon(
                          listOfIcons[index],
                          size: size.width * .0615,
                          color: index == currentIndex
                              ? Color(0xFFF8C358)
                              : Color.fromARGB(81, 255, 255, 255),
                        ),
                        SizedBox(height: size.width * .030),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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