import 'dart:io'; // Import Platform
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    // Initialize Firebase for Android
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD442yRoHWLCXSp-dhfZ0O0darUQ3fpVuQ',
        appId: '1:703997834475:android:60b5336fe2c6651a76faae',
        messagingSenderId: '703997834475',
        projectId: 'to-do-list-app-c45bd',
      ),
    );
  }

  runApp(const ToDoListApp());
}
