import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kenema/features/login/login_with_phone_screen.dart';
import 'package:kenema/features/pages/home_screen.dart';
import 'package:kenema/features/pages/map_page.dart';
import 'package:kenema/features/phone_confirmation/phone_confirmation.dart';
import 'package:kenema/features/splash/splash_screen.dart';
import 'package:kenema/store/patient_store.dart';
import 'package:kenema/store/prescription_store.dart';
import 'package:kenema/store/refill_store.dart';
import 'package:kenema/utils/constants/sizes.dart';
import 'package:kenema/utils/helpers/helper_function.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => PatientStore()),
      ChangeNotifierProvider(create: (ctx) => RefillStore()),
      ChangeNotifierProvider(create: (ctx) => prescriptionStore()),
      ChangeNotifierProvider<CurrentPageIndex>(
          create: (ctx) => CurrentPageIndex()),
    ],
    child: const MyApp(),
  )
      // ChangeNotifierProvider(
      //   create: (ctx) => PatientStore(),
      //   child: const MyApp(),
      // ),
      );
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
        "/login": (ctx) => Test(),
        "/home": (ctx) => const HomeScreen(),
        "/confirmation": (ctx) => const PhoneConfirmationScreen(),
        "/map": (ctx) => MapScreen(),
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
    await Future.delayed(const Duration(seconds: 2));

    var pref = await CHelperFunction.getInstance();
    var patient = pref.getString("patient");
    print(patient);
    await pref.clear();
    if (patient == null) {
      setState(() {
        checking = false;
      });
    } else {
      if (mounted) {
        Provider.of<PatientStore>(context, listen: false)
            .fromJson(jsonDecode(patient));
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (checking) {
      return const Scaffold(
        body: Center(
            child: Text(
          "Loading...",
          style: TextStyle(fontSize: CSizes.xl),
        )),
      );
    } else {
      return const SplashScreen();
    }
  }
}
