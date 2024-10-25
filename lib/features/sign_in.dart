import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool hidePass1 = true;
  bool hidePass2 = true;

  TextEditingController usernameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController idField = TextEditingController();
  TextEditingController password1Field = TextEditingController();
  TextEditingController password2Field = TextEditingController();

  var formkey = GlobalKey<FormState>();

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
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/MAIN_LOGO.png'),
                height: 200,
                width: 200,
              ),
              const Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF0A0170),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: usernameField,
                  decoration: const InputDecoration(
                    labelText: 'USERNAME',
                    labelStyle: TextStyle(
                      fontSize: 10.0,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 10.0,
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: emailField,
                  decoration: const InputDecoration(
                    labelText: 'WVSU EMAIL',
                    hintText: 'Example: abc@wvsu.edu.ph',
                    labelStyle: TextStyle(
                      fontSize: 10.0,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 10.0,
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: idField,
                  decoration: const InputDecoration(
                    labelText: 'WVSU ID',
                    hintText: 'Example: 2022M0000',
                    labelStyle: TextStyle(
                      fontSize: 10.0,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 10.0,
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  maxLength: 9,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your ID';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      controller: password1Field,
                      decoration: InputDecoration(
                        labelText: 'WVSU PASSWORD',
                        labelStyle: const TextStyle(
                          fontSize: 10.0,
                        ),
                        border: const UnderlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(hidePass1
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined),
                          onPressed: () {
                            setState(() {
                              hidePass1 = !hidePass1;
                            });
                          },
                        ),
                      ),
                      obscureText: hidePass1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      controller: password2Field,
                      decoration: InputDecoration(
                        labelText: 'CONFIRM PASSWORD',
                        labelStyle: const TextStyle(
                          fontSize: 10.0,
                        ),
                        border: const UnderlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(hidePass2
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined),
                          onPressed: () {
                            setState(() {
                              hidePass2 = !hidePass2;
                            });
                          },
                        ),
                      ),
                      obscureText: hidePass2,
                      validator: (value) {
                        if (value != password1Field.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 100,
                child: OutlinedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {}
                  },
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
