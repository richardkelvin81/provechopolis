import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provechopolis/VIEW/0features/home/home_public_screen.dart';
import 'package:provechopolis/VIEW/0features/videos/provider/discover_provider.dart';
import 'package:provider/provider.dart';

import 'CONFIG/app_theme.dart';
import 'firebase_options.dart';
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
        home: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
          child: HomePublicScreen())
      ),
    );
  }
}
