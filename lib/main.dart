import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'view_model/validation/sign_in_validation.dart';
import 'view_model/validation/sign_up_validation.dart';
import 'view_model/app_theme.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => AppTheme()),
      ChangeNotifierProvider(create: (context)=> SignInValidation()),
      ChangeNotifierProvider(create: (context)=> SignUpValidation())
    ],
    child: const App()
    )
      );
}