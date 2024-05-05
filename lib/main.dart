import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_setup/firebase_options.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

// configure windows path" will show you how. Activated flutterfire_cli 1.0.0.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp (
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    
  }
}