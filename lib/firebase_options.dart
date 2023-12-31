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
    apiKey: 'AIzaSyC1tl88DEqT7e27s0HfaxXjyb0R9dJ9ov8',
    appId: '1:11540371773:web:13c0243f04d00d7cbccd54',
    messagingSenderId: '11540371773',
    projectId: 'fir-project-flutter-ebf1a',
    authDomain: 'fir-project-flutter-ebf1a.firebaseapp.com',
    storageBucket: 'fir-project-flutter-ebf1a.appspot.com',
    measurementId: 'G-2LMFE1HGQK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYG1m6ag2wPVy8hYd108swrpBtds8IY84',
    appId: '1:11540371773:android:6f31f8f66b637573bccd54',
    messagingSenderId: '11540371773',
    projectId: 'fir-project-flutter-ebf1a',
    storageBucket: 'fir-project-flutter-ebf1a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB9qrT9faXprAodQdGLZzzdtrA-7SMbFE',
    appId: '1:11540371773:ios:c02a33fd3339966fbccd54',
    messagingSenderId: '11540371773',
    projectId: 'fir-project-flutter-ebf1a',
    storageBucket: 'fir-project-flutter-ebf1a.appspot.com',
    androidClientId: '11540371773-1donhf1cbqgntq5ug0isg6jjq0k3tvj8.apps.googleusercontent.com',
    iosClientId: '11540371773-lcg9iraijeanfacsec4a4m4avo1t7d5j.apps.googleusercontent.com',
    iosBundleId: 'com.example.providerFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBB9qrT9faXprAodQdGLZzzdtrA-7SMbFE',
    appId: '1:11540371773:ios:10f0668c4cd99e9ebccd54',
    messagingSenderId: '11540371773',
    projectId: 'fir-project-flutter-ebf1a',
    storageBucket: 'fir-project-flutter-ebf1a.appspot.com',
    androidClientId: '11540371773-1donhf1cbqgntq5ug0isg6jjq0k3tvj8.apps.googleusercontent.com',
    iosClientId: '11540371773-vaa0qq8q360qtv0d54rt3dcf92v171pn.apps.googleusercontent.com',
    iosBundleId: 'com.example.providerFirebase.RunnerTests',
  );
}
