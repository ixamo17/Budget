// ignore_for_file: deprecated_member_use

import 'package:budget/firebase_options.dart';
import 'package:budget/widgets/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
//ignore_for_file: use_super_parameters

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      builder: (context, child) {
        return MediaQuery(
         data:MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
         child: child!);
       },
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}

