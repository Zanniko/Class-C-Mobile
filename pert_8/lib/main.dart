import 'package:flutter/material.dart';
import 'package:pert_8/pages/Home_page.dart';
import 'package:pert_8/pages/animation_page.dart';
import 'package:pert_8/pages/custom_widget_page.dart';
import 'package:pert_8/pages/icons_page.dart';
import 'package:pert_8/pages/scroll_demo_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'icons': (context) => IconsPage(),
        'customw': (context) => CustomWidgetPage(),
        'scrollw': (context) => ScrollDemoPage(),
        'animation': (context) => AnimationPage()
      },
    );
  }
}
