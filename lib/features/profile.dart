import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String name = "RJ";
  final String studentId = "123456";
  final String email = "asdasdadasd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 20,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/MAIN_LOGO.png'),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text('NAME: $name', style: TextStyle(fontSize: 20)),
                  Text('EMAIL: $email', style: TextStyle(fontSize: 20)),
                  Text('ID: $studentId', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(
                thickness: 2, color: const Color.fromARGB(255, 60, 155, 193)),
            SizedBox(height: 20),
            _buildOutlinedButton('Accessibility', () {}),
            SizedBox(height: 10),
            _buildOutlinedButton('Theme', () {}),
            SizedBox(height: 10),
            _buildOutlinedButton('Edit Details', () {}),
            SizedBox(height: 10),
            _buildOutlinedButton('Log Out', () {}),
            SizedBox(height: 10),
            _buildOutlinedButton('Delete Account', () {}),
            SizedBox(height: 10),
            _buildOutlinedButton('Report A Problem', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 350,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.orange)),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.orange, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
