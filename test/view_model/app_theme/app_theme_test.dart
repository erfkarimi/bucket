import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bucket/view_model/app_theme.dart';

void main(){
  test("Testing app theme",
    (){
      AppTheme appTheme = AppTheme();
      appTheme.theme = "light";

      Color backgrounTheme = appTheme.backgroundtheme();
      Color appBarTheme = appTheme.appBarTheme();
      Color buttonTitleTheme = appTheme.buttonTitleTheme();
      Color buttonTheme = appTheme.buttonTheme();
      Color textFieldBorderTheme = appTheme.textFieldBorderTheme();
      Color dialogTheme = appTheme.dialogTheme();

      expect(backgrounTheme, Colors.white);
      expect(appBarTheme, const Color.fromRGBO(29, 161, 242, 1.0));
      expect(buttonTitleTheme, Colors.black);
      expect(buttonTheme, Colors.grey.shade200);
      expect(textFieldBorderTheme, const Color.fromRGBO(200, 200, 200, 0.1));
      expect(dialogTheme, Colors.white);
    });
    
}