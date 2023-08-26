// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBUSllPgISi7sXGV_gm5HlBaICOGkANmQo',
    appId: '1:1024917227104:web:978919ded45da8e661e505',
    messagingSenderId: '1024917227104',
    projectId: 'provechopolis',
    authDomain: 'provechopolis.firebaseapp.com',
    databaseURL: 'https://provechopolis-default-rtdb.firebaseio.com',
    storageBucket: 'provechopolis.appspot.com',
    measurementId: 'G-2G0BVXTH6B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlcrR82ZtAZsMT9uGukPdEuDduD_6jkQ4',
    appId: '1:1024917227104:android:d5be082c3147892761e505',
    messagingSenderId: '1024917227104',
    projectId: 'provechopolis',
    databaseURL: 'https://provechopolis-default-rtdb.firebaseio.com',
    storageBucket: 'provechopolis.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtb6C2w_qcakBFtFMWuqKRgfiPiCPFM9s',
    appId: '1:1024917227104:ios:78d2daba7aa02bb261e505',
    messagingSenderId: '1024917227104',
    projectId: 'provechopolis',
    databaseURL: 'https://provechopolis-default-rtdb.firebaseio.com',
    storageBucket: 'provechopolis.appspot.com',
    iosClientId: '1024917227104-c2ihm8socjmancf6jgoon0t3c5nilruh.apps.googleusercontent.com',
    iosBundleId: 'com.example.provechopolis',
  );
}