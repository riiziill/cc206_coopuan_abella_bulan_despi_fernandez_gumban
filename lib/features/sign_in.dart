import 'package:flutter/material.dart';

class signIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'USERNAME',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'WVSU EMAIL',
              hintText: 'Example: abc@wvsu.edu.ph',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'WVSU ID',
              hintText: 'Example: 2022M0000',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'WVSU PASSWORD',
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: signIn(),
  ));
}
