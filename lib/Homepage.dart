import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Authorization.dart';



class HomePage extends StatefulWidget {  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{
  String text='로그인';
  User? user;

  @override
  void initState()  {
    super.initState();
    user=  authservice.getcurrentUser();
    if (user!=null){
      text='로그아웃';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${user?.displayName}의 일기 리스트',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              if(user!=null){
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context,'/login');
            }
              else{
                Navigator.pushNamed(context,'/login');
              }},
            child: Text(
                text,
              style: TextStyle(
                color: Colors.black
              ),

            ),
          )
        ]
        ,),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ListView(
          children: List.generate(10,_buildDiary)
        ),


      ),
    floatingActionButton: FloatingActionButton(
      onPressed:(){

      } ,
      child: Icon(Icons.add),
      backgroundColor: Colors.brown,
    ),
    );

  }
}

Widget _buildDiary (int index) {
  return  Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(
            '일기가 들어갈 위치',
          ),
        ),

      ),
    );
}