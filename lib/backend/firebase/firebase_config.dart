import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCKYp6MLfQ2GBiUdwV5prXoZn34SxiyK68",
            authDomain: "whichmoment-38889.firebaseapp.com",
            projectId: "whichmoment-38889",
            storageBucket: "whichmoment-38889.appspot.com",
            messagingSenderId: "897248157130",
            appId: "1:897248157130:web:35a56d9e74cc1fbfac0333",
            measurementId: "G-0BVE0R9HQE"));
  } else {
    await Firebase.initializeApp();
  }
}
