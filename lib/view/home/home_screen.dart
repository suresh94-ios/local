import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:Text(translate("app_bar.title")
      )),
    );
  }
}
