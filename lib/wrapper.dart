import 'package:bucket/view/splash_screen/splash_screen.dart';
import 'package:bucket/view_model/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  WrapperState createState() => WrapperState();
}

class WrapperState extends State<Wrapper> {

  @override
  void initState() {
    super.initState();
    init(context);
  }
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    setState(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: appTheme.backgroundtheme(),
        statusBarColor: Colors.transparent,
      ));     
    });
      return const SplashScreen(
    );
  }

  init(context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final appTheme = Provider.of<AppTheme>(context, listen: false);   
    setState(() {
          appTheme.theme = prefs.getString("theme") ?? "light";
    });
  }
}