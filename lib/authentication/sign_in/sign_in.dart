import 'package:bucket/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../view_model/validation/sign_in_validation.dart';

class SignIn extends StatefulWidget{
  final Function? toggleView;
  const SignIn({super.key, this.toggleView});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override 
  Widget build(context){
    final validation = Provider.of<SignInValidation>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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

  Widget body(SignInValidation validation){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
           Text("Sign in",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 20),
            emailTextField(validation),
            const SizedBox(height: 15),
            passwordTextField(validation),
            const SizedBox(height: 20),
            signInButton(validation),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Don't have account ?"),
                      TextButton(
                        onPressed: (){
                          setState(() {
                            widget.toggleView!();
                          });
                        },
                        child: const Text("Sign up"),
                      )
                    ],
                  )
        ],
      ),
    );
  }

  Widget emailTextField(SignInValidation validation){
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
              onChanged: (String value){
                validation.changeEmail(value);
              },
        );
  }
  
  Widget passwordTextField(SignInValidation validation){
    return TextField(
      cursorColor: Colors.black,
      obscureText: validation.visibility,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Password',
          suffixIcon: IconButton(
            icon: validation.changeIconVisiability(),
            tooltip: "hello",
            onPressed: (){
              validation.changeVisiablity();
            },
          ),
          errorText: validation.password.error,
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

  Widget signInButton(SignInValidation validation){
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromRGBO(29, 161, 242, 1.0),
      onPressed: (!validation.isValid) ? null : () {
        Future.delayed(const Duration(seconds: 3), (){
          Navigator.pushReplacement(context,
         MaterialPageRoute(
          builder: (context){
            return const Home();
          }));
        });
      },
      child: const Text("Sign in",
          style: TextStyle(fontSize: 20, color: Colors.black)),
    );
  }

}