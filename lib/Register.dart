
import 'package:flutter/material.dart';
import 'components.dart';
import 'Authorization.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{


  @override
  Widget build(BuildContext context) {

  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(40),
      child: ListView(
          children: [
            Text('회원가입', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
            RegisterForm()
          ],
      )
    )
  );

  }
}