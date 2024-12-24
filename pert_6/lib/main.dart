import 'package:flutter/material.dart';
import 'package:pert_6/pages/drawer_page.dart';
import 'package:pert_6/pages/form_page.dart';
import 'package:pert_6/pages/home_page.dart';
import 'package:pert_6/pages/second_page.dart';
import 'package:pert_6/pages/tab_bar_page.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        '/second': (context) => const SecondPage(data: "this is a text data from homepage",),
        '/tabbar': (context) => const TabBarPage(),
        '/drawer': (context) => DrawerPage(),
        '/form': (context) => FormPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
