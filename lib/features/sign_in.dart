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

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Image(
                    image: AssetImage('assets/MAIN_LOGO.png'),
                    height: 200,
                    width: 200,
                  ),
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
                      labelStyle: TextStyle(fontSize: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
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
                      labelStyle: TextStyle(fontSize: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w\.-]+@wvsu\.edu\.ph$')
                          .hasMatch(value)) {
                        return 'Email must be @wvsu.edu.ph';
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
                      labelStyle: TextStyle(fontSize: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    maxLength: 9,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID';
                      } else if (!RegExp(r'^[a-zA-Z0-9]{9}$').hasMatch(value)) {
                        return 'ID must be 9 characters';
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
                          labelText: 'PASSWORD',
                          labelStyle: const TextStyle(fontSize: 10.0),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
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
                            return 'Please enter password';
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
                          labelStyle: const TextStyle(fontSize: 10.0),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A0170),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text('SIGN UP SUCCESSFUL'),
                              actions: [
                                TextButton(
                                  child: const Text('ENTER'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text(
                                  'SOME FIELDS ARE MISSING OR NOT ENTERRED CORRECTLY'),
                              actions: [
                                TextButton(
                                  child: const Text('CLOSE'),
                                  onPressed: () {
                                    // Navigator.pushNamed(context, 'logIn');
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a user? ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, 'logIn');
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xFF0A0170),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
