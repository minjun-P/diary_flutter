import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Homepage.dart';
import 'Register.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final TextEditingController emailcon= TextEditingController();
  final TextEditingController passwordcon= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/login':(context)=> LoginPage(),
        '/':(context)=> HomePage(),
        '/register':(context)=>RegisterPage()


      },

    );

  }
}

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_LoginPage();
}
 class _LoginPage extends State<LoginPage> {
   final TextEditingController emailcon = TextEditingController();
   final TextEditingController passwordcon = TextEditingController();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text('Login'),),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

           Padding(
             padding: const EdgeInsets.all(8.0),

             child: TextField(
               controller: emailcon,
               decoration: InputDecoration(labelText: 'email'),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               controller: passwordcon,
               decoration: InputDecoration(labelText: 'password'),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(onPressed: () {
               setState(() {

               });
             },
                 child: Text('Login')),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(onPressed: () {
               setState(() {
                 Navigator.pushNamed(context, '/register');

               });
             },
                 child: Text('Sign up')),
           )
         ],
       ),

     );
   }

 }
