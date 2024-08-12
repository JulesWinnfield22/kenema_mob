import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kenema/features/login/login_with_phone_screen.dart';
import 'package:kenema/features/splash/splash_screen.dart';
import 'package:kenema/store/patient_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => PatientStore(),
      child: const MyApp(),
    ),
  );
}

Future<SharedPreferences> getInstance() async {
  return await SharedPreferences.getInstance();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kenema',
      routes: {
        "/": (ctx) => const Splash(),
        "/login": (ctx) => const Test(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Splash();
  }
}

class _Splash extends State<Splash> {
  bool checking = true;
  @override
  void initState() {
    super.initState();
    _checkLoggedIn();
  }

  Future _checkLoggedIn() async {
    await Future.delayed(const Duration(seconds: 6));

    var pref = await getInstance();
    var patient = pref.getString("patient");

    if (patient == null) {
      setState(() {
        checking = false;
      });
    } else {
      if (mounted) {
        Provider.of<PatientStore>(context, listen: false)
            .fromJson(jsonDecode(patient));
        Navigator.of(context).pushNamed('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (checking) {
      return const Center(child: Text("Loading..."));
    } else {
      return const SplashScreen();
    }
  }
}
