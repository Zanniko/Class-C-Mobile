import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Custom Widgets Demo'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'implicit',),
              Tab(text: 'explicit',),
              Tab(text: 'hero',)
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ImplicitAnimationDemo(),
            ExplicitAnimationDemo(),
            Container()
          ],
        ),
      ),
    );  }
}


class ImplicitAnimationDemo extends StatefulWidget {
  const ImplicitAnimationDemo({super.key});

  @override
  State<ImplicitAnimationDemo> createState() => ImplicitAnimationDemoState();
}

class ImplicitAnimationDemoState extends State<ImplicitAnimationDemo> {
  bool _toggled = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _toggled = !_toggled;
          });
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _toggled ? 200 : 100,
          height: _toggled ? 100 : 200,
          decoration: BoxDecoration(
            color: _toggled ? Colors.green : Colors.blue,
            borderRadius: BorderRadius.circular(_toggled ? 0 : 50)
          ),
          child: Center(
            child: Text('Tap me!', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}


class ExplicitAnimationDemo extends StatefulWidget {
  const ExplicitAnimationDemo({super.key});

  @override
  State<ExplicitAnimationDemo> createState() => _ExplicitAnimationDemoState();
}

class _ExplicitAnimationDemoState extends State<ExplicitAnimationDemo> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
    ..addListener(() {
      setState(() {});
    },);
    _controller.repeat(reverse: true);
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _animation.value,
        height: _animation.value,
        color: Colors.orange,
      ),
    );
  }
}