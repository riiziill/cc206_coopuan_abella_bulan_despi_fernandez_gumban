import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/homepage.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const homePage();
          } else {
            return logIn();
          }
        },
      ),
    );
  }
}
