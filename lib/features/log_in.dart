import 'package:flutter/material.dart';

class logIn extends StatelessWidget {
  const logIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to DigiCOOP',
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
              const SizedBox(),
              const Image(
                image: AssetImage('assets/MAIN_LOGO.png'),
                height: 350,
                width: 400,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0),
                child: SizedBox(
                  width: 300,
                  child: Center(
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 10, 1, 112),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                  child: const Text('Log In'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 300,
                  child: Center(
                    child: Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 10, 1, 112),
                        fontWeight: FontWeight.normal,
                      ),  
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}