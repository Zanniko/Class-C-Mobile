import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pert_11/firebase_options.dart';
import 'package:pert_11/pages/login_page.dart';
import 'package:pert_11/pages/profile_page.dart';
import 'package:pert_11/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/profile' : (context) => ProfilePage(),
        '/register' : (context) => RegisterPage()
      },
    );
  }
}
