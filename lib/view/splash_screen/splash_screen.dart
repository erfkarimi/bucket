import 'package:bucket/authentication/auth/auth.dart';
import 'package:bucket/view_model/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
} 

class SplashScreenState extends State<SplashScreen>{

  @override 
  initState(){
    super.initState();
    Timer(const Duration(seconds: 2),
     ()=> Navigator.pushReplacement(context, 
        PageTransition(
          child: const Auth(),
          type: PageTransitionType.rightToLeft)
        ));
    }

  @override 
  Widget build(context){
    return Consumer<AppTheme>(
      builder: (context, appTheme, _) {
        return const Material(
          color: Color.fromRGBO(29, 161, 242, 1.0),
          child:  Center(
            child: Text("Bucket",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Kalam",
              fontSize: 50
            ),),
        ));
      }
    );
  }
}
