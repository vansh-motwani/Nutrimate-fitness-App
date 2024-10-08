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
    apiKey: 'AIzaSyAjm2_5eXjttJcL1ajfzZaugARNjeI8-5E',
    appId: '1:313011296856:web:0ce24ef2f2b5a0a8bb482d',
    messagingSenderId: '313011296856',
    projectId: 'nutrimate-15add',
    authDomain: 'nutrimate-15add.firebaseapp.com',
    storageBucket: 'nutrimate-15add.appspot.com',
    measurementId: 'G-1BQDD8K857',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATuDMjmOzELZZ3-5FJ7Na8EBBmV3_z_Ts',
    appId: '1:313011296856:android:1cfbc302ee5a37edbb482d',
    messagingSenderId: '313011296856',
    projectId: 'nutrimate-15add',
    storageBucket: 'nutrimate-15add.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhinBGgeJoYWZWabVMDPX3Je__c1yy9Pk',
    appId: '1:313011296856:ios:434ce95ffe3afa03bb482d',
    messagingSenderId: '313011296856',
    projectId: 'nutrimate-15add',
    storageBucket: 'nutrimate-15add.appspot.com',
    iosBundleId: 'com.example.nutrimate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhinBGgeJoYWZWabVMDPX3Je__c1yy9Pk',
    appId: '1:313011296856:ios:434ce95ffe3afa03bb482d',
    messagingSenderId: '313011296856',
    projectId: 'nutrimate-15add',
    storageBucket: 'nutrimate-15add.appspot.com',
    iosBundleId: 'com.example.nutrimate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAjm2_5eXjttJcL1ajfzZaugARNjeI8-5E',
    appId: '1:313011296856:web:b2cec81624083399bb482d',
    messagingSenderId: '313011296856',
    projectId: 'nutrimate-15add',
    authDomain: 'nutrimate-15add.firebaseapp.com',
    storageBucket: 'nutrimate-15add.appspot.com',
    measurementId: 'G-L7W7B6HQTH',
  );

}