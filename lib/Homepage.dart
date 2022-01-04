import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
User? curuser=FirebaseAuth.instance.currentUser;

class HomePage extends StatefulWidget {  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{
  String text='로그인';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (curuser!=null){
      text='로그아웃';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '일기 리스트',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context,'/login');
            },
            child: Text(
                text,
              style: TextStyle(
                color: Colors.black
              ),

            ),
          ),
          // 임시로 프로필 화면으로 넘어가는 아이콘버튼 생성, 나중엔 이걸 로그인시에만 활성화시켜야 할 듯.
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context,'/profile');
            },
            icon: Icon(Icons.person),
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
        Navigator.pushNamed(context,'/create');
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