import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pert_12/firebase_options.dart';
import 'package:pert_12/pages/crud_page.dart';
import 'package:pert_12/pages/login_page.dart';
import 'package:pert_12/pages/register_page.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/register': (context) => RegisterPage(),
        '/crud' : (context) => CrudPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


