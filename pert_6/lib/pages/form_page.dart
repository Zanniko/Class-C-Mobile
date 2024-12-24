import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _controller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Form"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'enter your name'),
              controller: _controller,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                final String nama = _controller.text;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("hello, $nama!")));
              },
              child: const Text("submit"),
            )
          ],
        ),
      ),
    );
  }
}