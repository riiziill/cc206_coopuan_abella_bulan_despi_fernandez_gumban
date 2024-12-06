import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/auth_service.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/homepage.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/log_in.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection('users');
  bool hidePass1 = true;
  bool hidePass2 = true;

  TextEditingController usernameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController idField = TextEditingController();
  TextEditingController bioField = TextEditingController();
  TextEditingController password1Field = TextEditingController();
  TextEditingController password2Field = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            usernameField = TextEditingController(text: userData['username']);
            idField = TextEditingController(text: userData['wvsuID']);
            bioField = TextEditingController(text: userData['bio']);
            return Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'ACCOUNT SETTINGS',
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
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
                          enabled: false,
                          initialValue: currentUser.email.toString(),
                          decoration: const InputDecoration(
                            labelText: 'WVSU EMAIL',
                            hintText: 'Example: abc@wvsu.edu.ph',
                            labelStyle: TextStyle(fontSize: 10.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                          maxLength: 9,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your ID';
                            } else if (!RegExp(r'^[a-zA-Z0-9]{9}$')
                                .hasMatch(value)) {
                              return 'ID must be 9 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: bioField,
                          decoration: const InputDecoration(
                            labelText: 'BIO',
                            labelStyle: TextStyle(fontSize: 10.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                          maxLength: 256,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
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
                                    title: const Row(
                                      children: [
                                        Icon(Icons.warning,
                                            color:
                                                Color.fromARGB(255, 255, 0, 0)),
                                        SizedBox(width: 10),
                                        Text(
                                          'Change profile info',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: const Text(
                                      'Apply changes?',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 0, 0),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('CANCEL'),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF0A0170),
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          updateInfo();
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Row(
                                                  children: [
                                                    Icon(Icons.check_circle,
                                                        color: Colors.green),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      'Success',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                content: const Text(
                                                  'Your info has been updated. Please log in again.',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          const Color(
                                                              0xFF0A0170),
                                                      foregroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      final _authService =
                                                          AuthService();
                                                      _authService.signOut();
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const logIn(),
                                                        ),
                                                      );
                                                    },
                                                    child:
                                                        const Text('CONTINUE'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const Text('CONFIRM'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Text('SAVE'),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF0A0170),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side:
                                    const BorderSide(color: Color(0xFF0A0170))),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('CANCEL'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void deleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.warning, color: Colors.red),
              SizedBox(width: 10),
              Text(
                'Delete Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.',
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CONFIRM'),
            ),
          ],
        );
      },
    );
  }

  void updateInfo() async {
    usersCollection.doc(currentUser.email).update(
      {'username': usernameField.text},
    );
    usersCollection.doc(currentUser.email).update(
      {'wvsuID': idField.text},
    );
    usersCollection.doc(currentUser.email).update(
      {'bio': bioField.text},
    );
  }
}
