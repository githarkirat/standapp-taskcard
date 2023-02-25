import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBnwWKfJDWqOobX180tRPc3RNfxvQCYw20",
            authDomain: "sitdowntodo.firebaseapp.com",
            projectId: "sitdowntodo",
            storageBucket: "sitdowntodo.appspot.com",
            messagingSenderId: "544113109718",
            appId: "1:544113109718:web:46801827b73af99b0a7777",
            measurementId: "G-TTBNWZ865J"));
  } else {
    await Firebase.initializeApp();
  }
}
