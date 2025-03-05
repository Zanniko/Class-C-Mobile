import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(
          'session 8 showcase'
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Icon Widgets'),
            subtitle: Text('Icon, IconButton, AnimatedIcon'),
            onTap: () => Navigator.pushNamed(context, 'icons'),
          ),
          ListTile(
            title: Text('Custom Widget'),
            subtitle: Text('Stack, DecoratedBox'),
            onTap: () => Navigator.pushNamed(context, 'customw'),
            
          ),
          ListTile(
            title: Text('Scrolled Widgets'),
            subtitle: Text('SingleChildScrollView, CustomScrollView'),
            onTap: () => Navigator.pushNamed(context, 'scrollw'),
          ),
          ListTile(
            title: Text('Animation'),
            subtitle: Text('Implicit, Explicit, Hero Animation'),
            onTap: () => Navigator.pushNamed(context, 'animation'),
          ),
        ],
      ),
    );
  }
}