import 'package:bucket/view_model/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatefulWidget{
  const ThemePage({Key? key}): super(key: key);

  @override 
  _ThemePageState createState()=> _ThemePageState();
}
class _ThemePageState extends State<ThemePage>{

 @override
 Widget build(context){
   final appTheme = Provider.of<AppTheme>(context);
   return Scaffold(
     backgroundColor: appTheme.backgroundtheme(),
        appBar: AppBar(
            backgroundColor: appTheme.appBarTheme(),
            elevation: 0.0,
           
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            title: const Text(
              "Themes",
              style: TextStyle(
                color: Colors.white
               ),
            )
            ), 
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              // App Theme button
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                elevation : .0,
                color: appTheme.buttonTheme(),
                child: Row(
                  children: [
                    Text("Dark",
                    style: TextStyle(
                      fontSize: 16,
                      color: appTheme.buttonTitleTheme()
                    ),),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),

                ),
                onPressed: (){
                  setState(() {
                  appTheme.theme = "dark";
                  appTheme.themeSetter();
                  });
                }
                ),
                const SizedBox(height: 10),
                MaterialButton(
                minWidth: double.infinity,
                height: 50,
                elevation : .0,
                color: appTheme.buttonTheme(),
                child: Row(
                  children: [
                    Text("Dim",
                    style: TextStyle(
                      fontSize: 16,
                      color: appTheme.buttonTitleTheme()
                    ),),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),

                ),
                onPressed: (){
                  setState(() {
                  appTheme.theme = "dim";
                  appTheme.themeSetter();
                  });
                }
                ),
                const SizedBox(height: 10),
                MaterialButton(
                minWidth: double.infinity,
                height: 50,
                elevation : .0,
                color: appTheme.buttonTheme(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Text("Light",
                    style: TextStyle(
                      fontSize: 16,
                      color: appTheme.buttonTitleTheme()
                    ),),
                  ],
                ),
                onPressed: (){
                  setState(() {
                  appTheme.theme = "light";
                  appTheme.themeSetter();
                  }); 
                }
                ),
                
            ],
          ),
        ),
   );
 }
}