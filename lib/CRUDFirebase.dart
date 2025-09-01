import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDFirebase extends StatefulWidget {
  const CRUDFirebase({super.key});

  @override
  State<CRUDFirebase> createState() => _CRUDFirebaseState();
}

class _CRUDFirebaseState extends State<CRUDFirebase> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  List<Map<String, dynamic>> userList = [];

  // Create or Update user by name
  void _createOrUpdateUser() async {
    String name = _nameController.text;

    QuerySnapshot snapshot =
        await users.where('name', isEqualTo: name).get();

    if (snapshot.docs.isNotEmpty) {
      // Update existing user
      await snapshot.docs.first.reference.update({
        'age': _ageController.text,
        'address': _addressController.text,
      });
    } else {
      // Create new user
      await users.add({
        'name': name,
        'age': _ageController.text,
        'address': _addressController.text,
      });
    }

    // Don't update the UI, just stay
  }

  // Read single user by name
  void _readUserByName() async {
    String name = _nameController.text;

    QuerySnapshot snapshot =
        await users.where('name', isEqualTo: name).get();

    setState(() {
      userList = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }

  // Delete user by name without showing message
  void _deleteUserByName(String name) async {
    QuerySnapshot snapshot =
        await users.where('name', isEqualTo: name).get();

    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }

    setState(() {
      userList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase CRUD"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.home),
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            Buttons('Create', Colors.red, _createOrUpdateUser),
            const SizedBox(height: 16),
            Buttons('Delete', Colors.blue,
                () => _deleteUserByName(_nameController.text)),
            const SizedBox(height: 16),
            Buttons('Read', Colors.grey, _readUserByName),
            const SizedBox(height: 24),

            if (userList.isNotEmpty) ...[
              const Text("User Info",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      title: Text("Name: ${user['name']}"),
                      subtitle: Text(
                          "Age: ${user['age']} | Address: ${user['address']}"),
                    ),
                  );
                },
              ),
            ]
          ]),
        ),
      ),
    );
  }
}

Widget Buttons(String txt, Color color, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      minimumSize: const Size(200, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    child: Text(txt,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  );
}
