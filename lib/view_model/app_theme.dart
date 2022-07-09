import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme with ChangeNotifier{
  String theme = "light";

  Color backgroundtheme(){
    if(theme == "dim"){
      return const Color.fromRGBO(20, 29, 38, 1.0);
    } else if(theme == "dark") {
        return Colors.grey.shade900;
    } else {
        return Colors.white;
    }
     
  }
  
  Color appBarTheme(){
    if(theme == "dim"){
      return const Color.fromRGBO(36, 52, 71, 1.0);
    } else if(theme == "dark"){
        return const Color(0xFF32373b);
    } else {
        return const Color.fromRGBO(29, 161, 242, 1.0);
    }
  }

  Color buttonTitleTheme(){
    if(theme == "light"){
        return Colors.black;
    } else{
        return Colors.white;
    } 
  }

  Color buttonTheme(){
    if(theme == "dim"){
      return const Color.fromRGBO(36, 52, 71, 1.0);
    } else if(theme == "dark"){
        return const Color(0xFF32373b);
    } else {
        return Colors.grey.shade200;
    }
  }

  Color textFieldBorderTheme(){
    if(theme == "dim"){
      return const Color.fromRGBO(36, 52, 71, 1.0);
    } else if(theme == "dark"){
       return const Color.fromRGBO(800, 800, 800, 1.0);
    } else{
       return const Color.fromRGBO(200, 200, 200, 0.1);
    } 
  }

  Color dialogTheme(){
    if(theme == "dim"){
      return const Color.fromRGBO(20, 29, 38, 1.0);
    } else if(theme == "dark"){
       return const Color.fromRGBO(900, 900, 900, 1.0);
    } else{
       return Colors.white;
    } 
  }

  themeSetter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("theme", theme);
    notifyListeners();
  }
}

