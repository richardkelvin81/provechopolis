import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/0features/videos/provider/discover_provider.dart';
import 'package:provechopolis/VIEW/0features/videos/widgets/shared/video_scrollable_view.dart';
import 'package:provechopolis/global_responsive.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xFF292A2C),
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Padding(
                padding: EdgeInsets.only(
                    top: 5,
                    bottom: GlobalResponsive.bigDiference(context) - 20),
                child: _CustomAppBar(),
              ),
              bottom: TabBar(
                  indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: 17,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Color(0xFFDA746F),
                  labelColor: Color(0xFFDA746F),
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          GlobalResponsive.bigDiference(context) * 2.35),
                  tabs: const [
                    Tab(
                      icon: Icon(Icons.home),
                      text: "En tu zona",
                    ),
                    Tab(
                      icon: Icon(Icons.search),
                      text: "Global",
                    ),
                  ])),
          body: discoverProvider.initialLoading
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Espere un momento',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gogh',
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ]),
                )
              : TabBarView(
                  children: [
                    VideoScrollableView(
                      videos: discoverProvider.videos,
                    ),
                    Center(child: Text("Hola Global"))
                  ],
                )),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(GlobalResponsive.bigDiference(context) - 7),
      child: Row(
        children: [
          Icon(
            Icons.live_tv,
            color: Colors.white,
            size: GlobalResponsive.bigDiference(context) - 5,
          ),
          Expanded(
            child: Center(
                child: SizedBox(
                    width: size.width < 400
                        ? 120
                        : size.width < 500
                            ? 160
                            : 200,
                    child: const Image(
                        image: AssetImage('assets/logolargo.png')))),
          ),
          Icon(
            Icons.live_tv,
            color: Colors.white,
            size: GlobalResponsive.bigDiference(context) - 5,
          ),
        ],
      ),
    );
  }
}