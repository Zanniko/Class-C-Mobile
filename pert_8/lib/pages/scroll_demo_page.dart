import 'package:flutter/material.dart';

class ScrollDemoPage extends StatelessWidget {
  const ScrollDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Custom Widgets Demo'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'SingleChildScrollView',),
              Tab(text: 'CustomScrollView',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollViewDemo(),
            CustomScrollViewDemo()
          ],
        ),
      ),
    );
  }
}


class SingleChildScrollViewDemo extends StatelessWidget {
  const SingleChildScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          20,
          (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Item ${index + 1}', style: TextStyle(fontSize: 20),),
          )
        ),
      ),
    );
  }
}

class CustomScrollViewDemo extends StatelessWidget {
  const CustomScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('CustomScrollView demo'),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('List Item ${index + 1}'),),
            childCount: 20
          ),
        )
      ],
    );
  }
}