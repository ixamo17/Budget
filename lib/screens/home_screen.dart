import 'package:budget/screens/login.dart';
import 'package:budget/widgets/hero_card.dart';
import 'package:budget/widgets/transactions_cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLogoutLoading = false;
  logOut() async{
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => LoginView())));
    
    setState(() {
      isLogoutLoading = false;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Hello, ",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: (){
             logOut();
          },
           icon: isLogoutLoading
            ? CircularProgressIndicator()
            : Icon(
              Icons.exit_to_app, 
              color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          HeroCard(),
          TransactionsCard(),         
          ],
      ),
    );
  }
}

