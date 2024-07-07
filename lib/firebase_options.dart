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
    apiKey: 'AIzaSyBW55kjNtODg3Sq1yOaWmCn7BDO7cKogi8',
    appId: '1:260661701993:web:d700fd501ddb726f3ee1f8',
    messagingSenderId: '260661701993',
    projectId: 'sn-tictok-clone',
    authDomain: 'sn-tictok-clone.firebaseapp.com',
    storageBucket: 'sn-tictok-clone.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4lumxuwKEUJscWn7IndbHXJgRM31UwZ8',
    appId: '1:260661701993:android:2d880abb67544cfe3ee1f8',
    messagingSenderId: '260661701993',
    projectId: 'sn-tictok-clone',
    storageBucket: 'sn-tictok-clone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRS9ASrG_9GQ2F5SwSBHuxtG3Mf4IzYrU',
    appId: '1:260661701993:ios:cd06d1a72ff5701b3ee1f8',
    messagingSenderId: '260661701993',
    projectId: 'sn-tictok-clone',
    storageBucket: 'sn-tictok-clone.appspot.com',
    iosBundleId: 'com.example.tiktokClone',
  );

}