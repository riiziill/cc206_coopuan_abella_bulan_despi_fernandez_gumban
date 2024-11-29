import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/auth_gate.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/firebase_options.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/services/kiosk1.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/reservation.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/homepage.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/sign_in.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/log_in.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/cart.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/receipt.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/settings.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/profile.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/services/kiosk1_items.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Kiosk1Items(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          'logIn': (BuildContext ctc) => const logIn(),
          'signIn': (BuildContext ctc) => const signIn(),
          'homePage': (BuildContext ctc) => const HomePage(),
          'reservation': (BuildContext ctc) => const Reservation(),
          'cart': (BuildContext ctc) => const Cart(),
          'receipt': (BuildContext ctc) => const Receipt(),
          'setting': (BuildContext ctc) => const settings(),
          'profile': (BuildContext ctc) => Profile(),
          'kiosk1': (BuildContext ctc) => const Kiosk1(),
        });
  }
}
