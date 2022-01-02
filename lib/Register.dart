import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{
  final TextEditingController emailcon = TextEditingController();
  final TextEditingController passwordcon = TextEditingController();
  final TextEditingController nicknamecon = TextEditingController();


  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(title:Text('Register'),),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10),
          child: TextField(
            controller: emailcon,
            decoration: InputDecoration(labelText: 'email'),

          ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailcon,
              decoration: InputDecoration(labelText: 'password'),

            ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailcon,
              decoration: InputDecoration(labelText: 'nickname'),

            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {
              setState(() {

              });
            },
                child: Text('Register')),
          )


        ],
      ),
    ) ,

  );

  }
}