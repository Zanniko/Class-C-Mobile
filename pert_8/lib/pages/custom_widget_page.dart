import 'package:flutter/material.dart';

class CustomWidgetPage extends StatelessWidget {
  const CustomWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Custom Widgets Demo'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Stack',),
              Tab(text: 'DecoratedBox',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StackDemo(),
            DecoratedBoxDemo()
          ],
        ),
      ),
    );
  }
}



class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}


class DecoratedBoxDemo extends StatelessWidget {
  const DecoratedBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.orange, Colors.redAccent]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 5)
          ]
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text('Decoreated Box', style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}