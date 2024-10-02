import 'package:flutter/material.dart';

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Back to Login',
          style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 10, 1, 112),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 0),
                child: SizedBox(
                  width: 300,
                  child: Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 10, 1, 112),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'USERNAME',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'WVSU EMAIL',
                    hintText: 'Example: abc@wvsu.edu.ph',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'WVSU ID',
                    hintText: 'Example: 2022M0000',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'WVSU PASSWORD',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
