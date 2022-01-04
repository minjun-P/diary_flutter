import 'package:diary/create_diary.dart';

import 'profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Homepage.dart';
import 'Register.dart';
import 'login.dart';
import 'package:firebase_database/firebase_database.dart';

final database=FirebaseDatabase(databaseURL: 'https://diaryproto-default-rtdb.asia-southeast1.firebasedatabase.app/');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
  print(database.databaseURL);
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/login':(context)=> LoginPage(),
        '/':(context)=> HomePage(),
        '/register':(context)=>RegisterPage(),
        '/profile':(conetext)=>ProfilePage(),
        '/create':(context)=>CreatePage()


      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),



      ),

    );

  }
}
/**
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
*/