import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AuthScreen(),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  User? user;

  Future signUp() async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );
      setState(() {
        user = userCredential.user;
      });
    } catch (e) {
      print('Sign-up failed: $e');
    }
  }

  Future signIn() async{
    try {
            UserCredential userCredential = await _auth.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text
            );
            setState(() {
              user = userCredential.user;
            });
    } catch (e) {
      print('Sign-in failed:$e');
    }
  }

  Future signOut() async{
    await _auth.signOut();
    setState(() {
      user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Authentication')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: signUp,
              child: Text('sign up'),
            ),
            if(user != null)
              Column(
                children: [
                  Text('sign up as : ${user!.email}'),
                  ElevatedButton(
                    onPressed: signOut,
                    child: Text('sign out'),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
