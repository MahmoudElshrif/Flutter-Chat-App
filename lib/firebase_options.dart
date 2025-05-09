// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDIGGoaWRPUKkJJn0Fwn3e0tDLNiMbuenc',
    appId: '1:675808015528:web:67cc01881dbdf1f99fbe9d',
    messagingSenderId: '675808015528',
    projectId: 'chatapptut-977e1',
    authDomain: 'chatapptut-977e1.firebaseapp.com',
    storageBucket: 'chatapptut-977e1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXLXHiXysHmyzS-8bd9jEZ5IidzFZMdwg',
    appId: '1:675808015528:android:0faaa503e40f97bd9fbe9d',
    messagingSenderId: '675808015528',
    projectId: 'chatapptut-977e1',
    storageBucket: 'chatapptut-977e1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJWssXuUO7Ds38LkzBNQ_ik9v8PM-1XAY',
    appId: '1:675808015528:ios:642206fd7e90671b9fbe9d',
    messagingSenderId: '675808015528',
    projectId: 'chatapptut-977e1',
    storageBucket: 'chatapptut-977e1.firebasestorage.app',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJWssXuUO7Ds38LkzBNQ_ik9v8PM-1XAY',
    appId: '1:675808015528:ios:642206fd7e90671b9fbe9d',
    messagingSenderId: '675808015528',
    projectId: 'chatapptut-977e1',
    storageBucket: 'chatapptut-977e1.firebasestorage.app',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIGGoaWRPUKkJJn0Fwn3e0tDLNiMbuenc',
    appId: '1:675808015528:web:a63681200962a3f99fbe9d',
    messagingSenderId: '675808015528',
    projectId: 'chatapptut-977e1',
    authDomain: 'chatapptut-977e1.firebaseapp.com',
    storageBucket: 'chatapptut-977e1.firebasestorage.app',
  );
}
