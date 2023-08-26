import 'package:flutter/material.dart';
import 'package:provechopolis/0features/home/home_public_screen.dart';
import 'package:provechopolis/0features/videos/provider/discover_provider.dart';
import 'package:provider/provider.dart';

import 'config/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: AppTheme.getTheme(),
        home: HomePublicScreen()
      ),
    );
  }
}
