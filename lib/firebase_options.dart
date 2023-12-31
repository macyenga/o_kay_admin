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
        return macos;
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
    apiKey: 'AIzaSyAMEGpfQRUooLYNSm_Sp9AUsOBfACal_y4',
    appId: '1:257443683914:web:3c000465c601e9c96710b3',
    messagingSenderId: '257443683914',
    projectId: 'kaysdraff',
    authDomain: 'kaysdraff.firebaseapp.com',
    storageBucket: 'kaysdraff.appspot.com',
    measurementId: 'G-G7E0JBX6TP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAm-JSZZ69UmXQQ0e7fb5YYedWCNvd6vy0',
    appId: '1:257443683914:android:0302ff6b8a4c26a36710b3',
    messagingSenderId: '257443683914',
    projectId: 'kaysdraff',
    storageBucket: 'kaysdraff.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5O1uIgQqLnFBW1lfUqIKKKxXAg1SJmik',
    appId: '1:257443683914:ios:bc15cc5428b3f2026710b3',
    messagingSenderId: '257443683914',
    projectId: 'kaysdraff',
    storageBucket: 'kaysdraff.appspot.com',
    iosBundleId: 'com.example.oKayAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5O1uIgQqLnFBW1lfUqIKKKxXAg1SJmik',
    appId: '1:257443683914:ios:031bb9d9a56e29fd6710b3',
    messagingSenderId: '257443683914',
    projectId: 'kaysdraff',
    storageBucket: 'kaysdraff.appspot.com',
    iosBundleId: 'com.example.oKayAdmin.RunnerTests',
  );
}
