import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Authorization.dart';
import 'create_diary.dart';
import 'dart:convert';
User? curuser=FirebaseAuth.instance.currentUser;
final database=FirebaseDatabase(databaseURL: 'https://diaryproto-default-rtdb.asia-southeast1.firebasedatabase.app/');

class HomePage extends StatefulWidget {  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{
  String text='로그인';
  List<Diary> diarylist=new List.empty(growable: true);

  void deleteDiary(int index){

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (curuser!=null){
      text='로그아웃';
    }
    String userdir='users/${authservice.getcurrentUser()?.uid}';

    database.ref(userdir).onChildAdded.listen((event) {
      print(event.snapshot.value.toString());
      final data =Map<String,dynamic>.from(event.snapshot.value as Map);
      setState(() {
        Diary s=Diary(data['title'],data['content']);
        s.key=event.snapshot.key;
        diarylist.add(s);
        print("diaryadded");
      });
    });
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
        child: Center(
          child:diarylist.length==0?CircularProgressIndicator():
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context,index){
                    return Card(
                    child:GridTile(
                    child: Container(
                          padding: EdgeInsets.all(20),
                          child:SizedBox(
                          child:GestureDetector(
                          onTap: (){},
                          onLongPress:(){
                            showDialog(context: context, builder: (context)
                            { return AlertDialog(
                              title:Text(diarylist[index].title!),
                              content: Text('삭제하시겠습니까'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed:(){
                                    String userdir='users/${authservice.getcurrentUser()?.uid}';

                                    database.ref(userdir).child(diarylist[index].key!).remove().then(
                                    (_){
                                      setState(() {
                                        diarylist.removeAt(index);
                                        Navigator.pop(context);
                                      });
                                    }
                                    );
                                  },
                                  child:Text('예'),
                                ),
                                TextButton(
                                  onPressed:(){
                                    Navigator.pop(context);
                                  },
                                  child:Text('아니오'),
                                )
                              ],
                            );

                            });
                          },
                          child:Text(diarylist[index].content!,textAlign: TextAlign.center,style: TextStyle(color: Colors.blue),)
                          ),

                          )
    ),                    header:Text(diarylist[index].title!),
                    )
                    );
    } ,itemCount: diarylist.length,
        ),


      )),
    floatingActionButton: FloatingActionButton(
      onPressed:() {
        Navigator.pushNamed(context, '/create');
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.brown,
    ),
    );

  }
}

