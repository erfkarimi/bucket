import 'package:flutter/material.dart';
import '../wrapper.dart';

class App extends StatelessWidget{
  const App({Key? key}): super(key: key);

  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Wrapper()
    );
  }
}