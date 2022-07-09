import 'package:bucket/authentication/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

import '../sign_in/sign_in.dart';

class Auth extends StatefulWidget{
  const Auth({super.key});

  @override 
  AuthState createState()=> AuthState();
}

class AuthState extends State<Auth>{

  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }


  @override 
  Widget build(context){
    if (showSignIn){
     return SignIn(toggleView: toggleView);
   } else {
     return SignUp(toggleView: toggleView);
   }
  }
}