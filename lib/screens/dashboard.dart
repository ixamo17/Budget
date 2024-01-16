import 'package:budget/screens/home_screen.dart';
import 'package:budget/screens/login.dart';
import 'package:budget/screens/transac_screen.dart';
import 'package:budget/widgets/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var pageViewList = [const HomeScreen(), const TransacScreen()];

  logOut() async{
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const LoginView())));
    setState(() {
      isLogoutLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(selectedIndex: currentIndex, onDestinationSelected: (int value) {
         setState(() {
           currentIndex = value;
         });
        },),
 
      body: pageViewList[currentIndex],
    );
  }
}