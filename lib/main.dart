import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/sign_in.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/log_in.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/notification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'logIn',
      routes: {
        'logIn': (BuildContext context) => logIn(),
        'signIn': (BuildContext context) => signIn(),
      },
    );
  }
}
