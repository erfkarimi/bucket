import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../view_model/validation/sign_up_validation.dart';
import '../../view/home/home.dart';

class SignUp extends StatefulWidget{
  final Function? toggleView;
  const SignUp({super.key, this.toggleView});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  @override 
  Widget build(context){
    final validation = Provider.of<SignUpValidation>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: body(validation)
    );
  }

  AppBar appBar(){
    return AppBar(
        toolbarHeight: 200,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(29, 161, 242, 1.0),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white
        ),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text("Bucket",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Kalam",
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                )
                ),
          ),
        );
  }

  Widget body(SignUpValidation validation){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Text("Sign up",
           style: TextStyle(
             fontSize: 20,
             color: Colors.grey.shade700,
             fontWeight: FontWeight.bold
           )),
           const SizedBox(height: 20),
           nameTextFiedl(validation),
           const SizedBox(height: 15),
           emailTextField(validation),
           const SizedBox(height: 15),
           passwordTextField(validation),
           const SizedBox(height: 15),
           confPassTextFiedl(),
           const SizedBox(height: 20),
           signUpButton(validation),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     const Text("Already have account ?"),
                     TextButton(
                       onPressed: (){
                         setState(() {
                           widget.toggleView!();
                         });
                       },
                       child: const Text("Sign in"),
                     )
                   ],
                 ),
        ],
      ),
    );
  }

  Widget nameTextFiedl(SignUpValidation validation){
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Name',
          errorText: validation.name.error,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          contentPadding: const EdgeInsets.all(14)),
      onChanged: (String value) {
        validation.changeName(value);
      },
    );
  }

  Widget emailTextField(SignUpValidation validation){
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Email',
          errorText: validation.email.error,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          contentPadding: const EdgeInsets.all(14)),
      onChanged: (String value) {
        validation.changeEmail(value);
      },
    );
  }

  Widget passwordTextField(SignUpValidation validation){
    return TextField(
      cursorColor: Colors.black,
      obscureText: validation.visibility,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Password',
          errorText: validation.password.error,
          suffixIcon: IconButton(
            icon: validation.changeIconVisiability(),
            onPressed: (){
              validation.changeVisiablity();
            },
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          contentPadding: const EdgeInsets.all(14)),
      onChanged: (String value) {
        validation.changePassword(value);
      },
    );
  }

  Widget confPassTextFiedl(){
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Confirm password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200)),
          contentPadding: const EdgeInsets.all(14)),
      onChanged: (String value) {
      },
    );
  }

  Widget signUpButton(SignUpValidation validation){
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromRGBO(29, 161, 242, 1.0),
      onPressed: (!validation.isValid) ? null : (){
        Future.delayed(const Duration(seconds: 3), (){
          Navigator.pushReplacement(context,
         MaterialPageRoute(
          builder: (context){
            return const Home();
          }));
        });
      },
      child: const Text("Sign up",
          style: TextStyle(fontSize: 20, color: Colors.black)),
    );
  }


}