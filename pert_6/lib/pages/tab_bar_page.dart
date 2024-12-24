import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        title: const Text("TabBar Demo"),
        backgroundColor: Colors.blue,
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.cloud_circle_outlined), text: 'cloudy', ),
            Tab(icon: Icon(Icons.umbrella_outlined), text: 'rainy',),
            Tab(icon: Icon(Icons.sunny), text: 'sunny',)
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          Center(child: Text("it is cloudy right now"),),
          Center(child: Text("it is rainy right now"),),
          Center(child: Text("it is sunny right now"),)
        ],
      ),
    )
    ); 

  }
}