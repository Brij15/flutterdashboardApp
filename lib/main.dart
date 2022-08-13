import 'package:dashboard_app/ui/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//Main Application Function
//Uncomment Firebase Options code for Web (chrome) browser running
//Comment Firebase Options code for Android Application
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( // Replace with actual values
    //options: FirebaseOptions(
    //  apiKey: "AIzaSyD6uq6LjGz8mn3nVg6y2hTUmWybVw4g_3E",
    //  appId: "com.example.dashboard_app",
    //  messagingSenderId: "399743349005",
    //  projectId: "dashboard-app-ca6a4",
    //),
  );
  
  runApp(MyApp());
}

//Display Authentication page (register, login).
class MyApp extends StatelessWidget {
  static final String title = 'Dashboard App';
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: Authentication(),
  );
}
