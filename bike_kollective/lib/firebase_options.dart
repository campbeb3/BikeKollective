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
    apiKey: 'AIzaSyAJ8z5ypEOkOk3bVrgqROdpjlhdie91Y-8',
    appId: '1:416092678038:web:a13c0f6d836f3299a31fb7',
    messagingSenderId: '416092678038',
    projectId: 'bike-kollective-c4659',
    authDomain: 'bike-kollective-c4659.firebaseapp.com',
    storageBucket: 'bike-kollective-c4659.appspot.com',
    measurementId: 'G-LK9RP830XD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARbVeo5iOA6zIHYG41VLGFwQboeziEJdM',
    appId: '1:416092678038:android:d92f3ba9bfe50d38a31fb7',
    messagingSenderId: '416092678038',
    projectId: 'bike-kollective-c4659',
    storageBucket: 'bike-kollective-c4659.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbl6ahqR4X9MZFo1L9m1nfSrgDIBtW4Ng',
    appId: '1:416092678038:ios:d4e6d0d7e68ec82ba31fb7',
    messagingSenderId: '416092678038',
    projectId: 'bike-kollective-c4659',
    storageBucket: 'bike-kollective-c4659.appspot.com',
    iosBundleId: 'com.example.bikeKollective',
  );
}