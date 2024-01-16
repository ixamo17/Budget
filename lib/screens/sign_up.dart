import 'package:budget/screens/dashboard.dart';
import 'package:budget/screens/login.dart';
import 'package:budget/services/authen_service.dart';
import 'package:flutter/material.dart';
import 'package:budget/utils/appvalidator.dart';

// ignore_for_file: use_key_in_widget_constructors
// ignore_for_file: use_super_parameters
// ignore_for_file: use_build_context_synchronously
// ignore_for_file: prefer_const_constructors
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors_in_immutablesç
//ignore_for_file:avoid_print

class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _nphoneController = TextEditingController();
  final _passwordController = TextEditingController();

  var authenService = AuthService();
  var isLoader = false;
  
  Future<void> _submitForm() async {
    if(_formkey.currentState!.validate()){
    setState(() {
      isLoader = true;
    });

    var data = {
      'username': _userNameController.text,
      'email': _emailController.text,
      'Nºphone': _nphoneController.text,
      'password': _passwordController.text
    };

    await authenService.createUser(data, context);
    Navigator.removeRoute(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
             );
    setState(() {
      isLoader = false;
    });
    
    
    
    //if(_formkey.currentState!.validate()){
      //ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
        //const SnackBar(content: Text('Form submitted successfully')),
      //);
    }
  }

var appvalidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
           child: Column(
          children: [
            const SizedBox(
              height: 80.0,
            ),

            const SizedBox(
              width: 250,
              child: Text(
                "Create new Account",
                textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold),),
            ),

            const SizedBox(
              height: 50.0,
            ),
            
            //cree bar du username
            TextFormField(
              controller: _userNameController,
              style: const TextStyle(
                color: Colors.white,
                ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _builtInputDecoration("UserName",Icons.person),
             validator: appvalidator.validateUsername,
             
            ),

            const SizedBox(
              height: 16.0,
            ),

            //cree bar d'email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Colors.white,
                ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _builtInputDecoration("Email",Icons.email),
              validator: appvalidator.ValidateEmail,
              ),

            const SizedBox(
              height: 16.0,
            ),

            //cree bar du numero telephone
            TextFormField(
              controller: _nphoneController,
              style: const TextStyle(
                color: Colors.white,
                ),
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _builtInputDecoration("Nº tel",Icons.call),
               validator: appvalidator.validatePhoneNumber,
            ),

            const SizedBox(
              height: 16.0,
            ),

            //cree bar du password
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _builtInputDecoration("Password",Icons.lock),
               validator: appvalidator.validatePassword,
            ),

            const SizedBox(
              height: 40.0,
            ),

            SizedBox(
              height: 50,
              width: double.infinity,
              child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 241, 89, 0)
                    ),
                    onPressed:(){
                      isLoader ? print("Loading"):_submitForm();
                    },
                    child: isLoader 
                    ? const Center(child: CircularProgressIndicator())
                    : const Text('Create',
                     style: TextStyle(color: Colors.white,fontSize: 20)))),
          const SizedBox(
             height: 30.0,
           ),
           TextButton(
            onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => LoginView()),
             );
            },
             child: const Text(
             "Login",
             style:
                  TextStyle(color: Color(0xFFF15900), fontSize: 20),
             ),
           )
           

          ],
        )),
      ));
  }

  InputDecoration _builtInputDecoration(String label, IconData suffixIcon){
    return InputDecoration(
      fillColor: const Color(0xAA494A59),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x35949494))),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white)),
      filled: true,
      labelStyle: const TextStyle(color: Color(0xFF949494)),
      labelText: label,
      suffixIcon: Icon(
        suffixIcon,
        color: const Color(0xFF949494),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}