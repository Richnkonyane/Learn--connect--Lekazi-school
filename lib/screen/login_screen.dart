import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Learn & Connect - Lekazi')),
    body: Padding(padding: EdgeInsets.all(16), child: Column(
      mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.school, size: 80, color: Color(0xFF0D47A1)),
        SizedBox(height: 20),
        Text('Welcome to Lekazi Secondary', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('Offline learning during load shedding', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        SizedBox(height: 40),
        TextField(controller: nameController, decoration: InputDecoration(labelText: 'Enter your name', border: OutlineInputBorder())),
        SizedBox(height: 20),
        ElevatedButton(onPressed: () {
          if (nameController.text.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Welcome ${nameController.text}! MVP ready for Mr Nkosi.')));
          }
        }, child: Text('Continue as Learner')),
        SizedBox(height: 10),
        TextButton(onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Teacher Dashboard - Phase 2')));
        }, child: Text('Teacher Dashboard')),
    ])),
  );
}
