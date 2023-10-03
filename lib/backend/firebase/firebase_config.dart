import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCNqw7g2OiteDQ3WAdRcX-G9CnjN5BCAVo",
            authDomain: "projredesocialunemat.firebaseapp.com",
            projectId: "projredesocialunemat",
            storageBucket: "projredesocialunemat.appspot.com",
            messagingSenderId: "75347183678",
            appId: "1:75347183678:web:df28b4556e453a70aee96f"));
  } else {
    await Firebase.initializeApp();
  }
}
