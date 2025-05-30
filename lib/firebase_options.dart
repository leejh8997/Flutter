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
    apiKey: 'AIzaSyBBir8ICD3onk9wF7Axtw45lQWok5Ot_Vk',
    appId: '1:403579117521:web:0d5229ebb3a23663218af0',
    messagingSenderId: '403579117521',
    projectId: 'flutter250529',
    authDomain: 'flutter250529.firebaseapp.com',
    storageBucket: 'flutter250529.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4YawAowA_Z8XTjPmSYsQ2hmDJ0YKvwVI',
    appId: '1:403579117521:android:3818caa518dfc6e2218af0',
    messagingSenderId: '403579117521',
    projectId: 'flutter250529',
    storageBucket: 'flutter250529.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFCjShzUMG5b50QW9_SjNtGNx_wC8tYgg',
    appId: '1:403579117521:ios:f8b9c4bdd8d54ae4218af0',
    messagingSenderId: '403579117521',
    projectId: 'flutter250529',
    storageBucket: 'flutter250529.firebasestorage.app',
    iosBundleId: 'com.example.test2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFCjShzUMG5b50QW9_SjNtGNx_wC8tYgg',
    appId: '1:403579117521:ios:f8b9c4bdd8d54ae4218af0',
    messagingSenderId: '403579117521',
    projectId: 'flutter250529',
    storageBucket: 'flutter250529.firebasestorage.app',
    iosBundleId: 'com.example.test2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBir8ICD3onk9wF7Axtw45lQWok5Ot_Vk',
    appId: '1:403579117521:web:398f1e31139743ae218af0',
    messagingSenderId: '403579117521',
    projectId: 'flutter250529',
    authDomain: 'flutter250529.firebaseapp.com',
    storageBucket: 'flutter250529.firebasestorage.app',
  );
}
