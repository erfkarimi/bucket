import 'package:bucket/model/validation/validation_item.dart';
import 'package:flutter/material.dart';

class SignUpValidation with ChangeNotifier{
  bool visibility = true;
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _name = ValidationItem(null, null);

  // Getters
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get name => _name;
  bool get isValid {
    if(_email.value != null && password.value != null && name.value != null ){
      return true;
    } else {
      return false;
    }
  }

  // Setters
  void changeEmail(String value){
    if(value.contains("@")){
      _email = ValidationItem(value, null);

    } else {
      _email = ValidationItem(null, "Email is invalid");
    }
    notifyListeners();
  }

  void changePassword(String value){
    if(value.length >= 8){
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(null, "Password must be at least 8 charactors");
    }
    notifyListeners();
  } 

  void changeName(String value){
    if(value.length >= 4){
      _name = ValidationItem(value, null);
    } else {
      _name = ValidationItem(null,"Name must be at least 4 charactors");
    }
    notifyListeners();
  }

  void changeVisiablity(){
    if(visibility == true){ 
      visibility = false;
    } else {
      visibility = true;
    }
    notifyListeners();
  }
  
  Icon changeIconVisiability(){
    if(visibility == false){
      return const Icon(Icons.visibility, color: Colors.grey,);
    } else {
      return const Icon(Icons.visibility_off, color: Colors.grey,);
    }
  }

}