import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoredemoPage extends StatefulWidget {
  const FirestoredemoPage({super.key});

  @override
  State<FirestoredemoPage> createState() => _FirestoredemoPageState();
}

class _FirestoredemoPageState extends State<FirestoredemoPage> {
  List<Map> users = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _readUsers();
  }


  Future _adduserFromInput() async{
    try {
      String name = _nameController.text;
      int age = int.tryParse(_ageController.text) ?? 0;
      
      DocumentReference docRef = await _firestore.collection('users').add({
        'name': name,
        'age': age,
        'timestamp': FieldValue.serverTimestamp()
      }); 
      _clearInputs();
      _readUsers();

    } catch (e) {
      print('error adding user: $e');
    }
  }

  Future _readUsers() async{
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      List<Map<String, dynamic>> allUsers = snapshot.docs.map((doc){
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
      setState(() {
        users = allUsers;
      });

    } catch (e) {
      print('Error reading users: $e');
    }
  }

  Future _deleteUser(String docId) async{
    try {
      await _firestore.collection('users').doc(docId).delete();
      _readUsers();
    } catch (e) {
     print('Error deleting user: $e'); 
    }
  }


  Future _setUser() async{
    try {
      String name = _nameController.text;
      int age = int.tryParse(_ageController.text) ?? 0;
      await _firestore.collection('users').doc('user123').set({
        'name': name,
        'age': age,
        'timestamp': FieldValue.serverTimestamp()
      });
      _clearInputs();
      _readUsers();

    } catch (e) {
      
    }
  }

  void _clearInputs(){
    _nameController.clear();
    _ageController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore CRUD Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter name'
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Enter age'
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _adduserFromInput,
                  child: Text('add user (.add)'),
                ),
                SizedBox(width: 16,),
                ElevatedButton(
                  onPressed: _setUser,
                  child: Text('set user (.set)'),
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user['name'] ?? 'no name'),
                    subtitle: Text('Age" ${user['age'] ?? 'N/A'}'),
                    trailing: IconButton(
                      onPressed: () {
                        _deleteUser(user['id']);
                      },
                      icon: Icon(Icons.delete, color: Colors.red,),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ) 
    );
    
  }
}