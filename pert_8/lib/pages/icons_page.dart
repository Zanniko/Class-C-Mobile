import 'package:flutter/material.dart';

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onIconPress(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("icon button pressed"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icon widget demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Normal Icons"),
            SizedBox(height: 20,),
            Icon(Icons.home, size: 50, color: Colors.blue,),
            SizedBox(height: 20,),
            Icon(Icons.search_outlined, size: 50, color: Colors.red,),
            SizedBox(height: 20,),
            Icon(Icons.check_sharp, size: 50, color: Colors.green,),
            SizedBox(height: 20,),
            Text("this is an icon button"),
            SizedBox(height: 20,),
            IconButton(
              onPressed: _onIconPress,
              icon: Icon(
                Icons.shopping_bag_rounded,
                color: Colors.pink,
                size: 40,
              ),
            ),
            SizedBox(height: 20,),
            Text("this is an animated icon"),
            AnimatedIcon(
              icon: AnimatedIcons.pause_play,
              progress: _controller,
              size: 50,
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}