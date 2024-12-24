import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;

  const SecondPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("back to home page"),
            )
          ],
        ),
      ),
    );
  }
}