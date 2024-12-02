import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                        register();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.green),
                                  SizedBox(width: 10),
                                  Text(
                                    'Success',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              content: const Text(
                                'Congratulations, your account has been successfully created.',
                                style: TextStyle(fontSize: 14),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0A0170),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, 'homePage'),
                                  child: const Text('CONTINUE'),
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
                              title: const Row(
                                children: [
                                  Icon(Icons.warning, color: Colors.red),
                                  SizedBox(width: 10),
                                  Text(
                                    'Errors Found',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              content: const Text(
                                'One of the required fields is empty or contains invalid data. Please check your input.',
                                style: TextStyle(fontSize: 14),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0A0170),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OKAY'),
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
                        Navigator.pushNamed(context, 'logIn');
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

  void register() async {
    final _authService = AuthService();

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailField.text,
        password: password1Field.text,
      );

      FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.email)
          .set({
        'username': usernameField.text,
        'email': emailField.text,
        'wvsuID': idField.text,
        'bio': 'Bio is empty.'
      });
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }
}
