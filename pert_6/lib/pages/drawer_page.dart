import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Demo"),
        backgroundColor: Colors.blue,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text("Menu"),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text("Favorites"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
      
      body: const Center(
        child: Text("this is drawer demo page"),
      ),
    );
  }
}