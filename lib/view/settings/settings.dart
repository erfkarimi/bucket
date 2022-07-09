import 'package:bucket/authentication/sign_in/sign_in.dart';
import 'package:bucket/view/settings/theme/theme.dart';
import 'package:bucket/view_model/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(context) {
    final appTheme = Provider.of<AppTheme>(context);
    return Scaffold(
      backgroundColor: appTheme.backgroundtheme(),
      appBar: AppBar(
          backgroundColor: appTheme.appBarTheme(),
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        children: [
          const SizedBox(height: 10),
          themeButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

// Buttons
  Widget themeButton() {
    return Consumer(
      builder: (context, AppTheme appTheme, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                elevation: .0,
                color: appTheme.buttonTheme(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const ThemePage(),
                          type: PageTransitionType.rightToLeft));
                },
                child: Row(
                  children: [
                    Text(
                      "Theme",
                      style: TextStyle(
                          fontSize: 16, color: appTheme.buttonTitleTheme()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
