import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  Future _register() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': nameController.text,
          'phone': phoneController.text,
          'email': emailController.text.trim(),
        });
      }
      // navigasi ke crud page
      Navigator.pushReplacementNamed(context, '/crud');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('register failed: $e')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone number'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                isLoading ? null : _register();
              },
              child: isLoading ? CircularProgressIndicator() : Text('register'),
            ),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              child: Text("already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
