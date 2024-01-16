
import 'package:budget/screens/sign_up.dart';
import 'package:budget/services/authen_service.dart';
import 'package:budget/utils/appvalidator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginView extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;
  var authenService = AuthService();


  Future <void>_submitForm() async{
    if(_formkey.currentState!.validate()){
       setState(() {
      isLoader = true;
    });

    var data = {
      'email': _emailController.text,
      'password': _passwordController.text
    };

    await authenService.Login(data, context);
    
    setState(() {
      isLoader = false;
    });
    }
  }

var appvalidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
           child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),

            SizedBox(
              width: 250,
              child: Text(
                "Login Account",
                textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold),),
            ),

            
            SizedBox(
              height: 16.0,
            ),

            //cree bar d'email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _builtInputDecoration("Email",Icons.email),
              validator: appvalidator.ValidateEmail,
              ),

            

            SizedBox(
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

            SizedBox(
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
                    : const Text('Login',
                     style: TextStyle(color: Colors.white,fontSize: 20)))),
          SizedBox(
             height: 30.0,
           ),
           TextButton(onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder:
             (context) => SignUpView()),
            );
           },
             child: Text(
             "Create new Account",
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
      fillColor: Color(0xAA494A59),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x35949494))),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white)),
      filled: true,
      labelStyle: TextStyle(color: Color(0xFF949494)),
      labelText: label,
      suffixIcon: Icon(
        suffixIcon,
        color: Color(0xFF949494),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}