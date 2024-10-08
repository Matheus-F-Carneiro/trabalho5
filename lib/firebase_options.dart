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
    apiKey: 'AIzaSyCTEBryTbpLrxRwd3oTB11bu-8SGfLDg8Q',
    appId: '1:686751681787:web:58917c803f8ba1e4bd745e',
    messagingSenderId: '686751681787',
    projectId: 'trabalho-5-2eb03',
    authDomain: 'trabalho-5-2eb03.firebaseapp.com',
    storageBucket: 'trabalho-5-2eb03.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdA0GeyzhcDoQpYyOtn6riccZ4oITwUL0',
    appId: '1:686751681787:android:83a51033c7e38c3bbd745e',
    messagingSenderId: '686751681787',
    projectId: 'trabalho-5-2eb03',
    storageBucket: 'trabalho-5-2eb03.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXkbtKe515KECmfdFz8IjGVuI6fUowtxE',
    appId: '1:686751681787:ios:825d371885c821acbd745e',
    messagingSenderId: '686751681787',
    projectId: 'trabalho-5-2eb03',
    storageBucket: 'trabalho-5-2eb03.appspot.com',
    iosBundleId: 'com.example.trabalho5',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXkbtKe515KECmfdFz8IjGVuI6fUowtxE',
    appId: '1:686751681787:ios:825d371885c821acbd745e',
    messagingSenderId: '686751681787',
    projectId: 'trabalho-5-2eb03',
    storageBucket: 'trabalho-5-2eb03.appspot.com',
    iosBundleId: 'com.example.trabalho5',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTEBryTbpLrxRwd3oTB11bu-8SGfLDg8Q',
    appId: '1:686751681787:web:a32cdeeb3fd9575fbd745e',
    messagingSenderId: '686751681787',
    projectId: 'trabalho-5-2eb03',
    authDomain: 'trabalho-5-2eb03.firebaseapp.com',
    storageBucket: 'trabalho-5-2eb03.appspot.com',
  );
}
