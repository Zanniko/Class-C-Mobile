import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  final User? currentUser = FirebaseAuth.instance.currentUser;
  late DocumentReference userDocRef;

  @override
  void initState() {
    super.initState();
    if (currentUser != null) {
      userDocRef = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid);
      _loadUserData();
    }
  }

  Future _loadUserData() async {
    try {
      DocumentSnapshot doc = await userDocRef.get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        nameController.text = data['name'] ?? '';
        phoneController.text = data['phone'] ?? '';
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('failed to load data: $e')));
    }
  }

  Future _updateUserData() async {
    setState(() {
      isLoading = true;
    });
    try {
      await userDocRef.update({
        'name': nameController.text,
        'phone': phoneController.text,
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('data updated')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('data failed to update: $e')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future _deleteAccount() async {
    setState(() {
      isLoading = true;
    });
    try {
      // delete from firestore
      await userDocRef.delete();
      // delete firebase auth
      await currentUser!.delete();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('delete successfull')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('delete failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CRUD')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                isLoading ? null : _updateUserData();
              },
              child:
                  isLoading
                      ? CircularProgressIndicator()
                      : Text('update details'),
            ),
            ElevatedButton(
              onPressed: () {
                isLoading ? null : _deleteAccount();
              },
              child:
                  isLoading
                      ? CircularProgressIndicator()
                      : Text('delete current user'),
            ),
          ],
        ),
      ),
    );
  }
}
