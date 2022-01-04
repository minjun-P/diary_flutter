import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Authorization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
final database=FirebaseDatabase(databaseURL: 'https://diaryproto-default-rtdb.asia-southeast1.firebasedatabase.app/');

class Diary {
  String? key;  //document마다 hash로 부여된 키값저장 (수정,삭제)에 필요
  String? title;
  String? content;

  Diary(this.title, this.content);

  toJSON(){
    return{
      'title':title,
      'content':content
    };
  }
}



class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // 폼 제어 위한 키 설정
  final _form = GlobalKey<FormState>();


  // 개별 텍스트필드 제어 위한 키 설정
  final _titleCon = TextEditingController();
  final _contentCon = TextEditingController();

  // 입력 값을 저장할 객체 생성
  Diary diary = Diary("","");

  // 포커스 노드 선언해보기
  final _contentFocusNode = FocusNode();


  @override
  void dispose() {
    // TODO: implement dispose
    // 텍스트 컨트롤러 dispose 꼭 해주어야 함!! 
    _titleCon.dispose();
    _contentCon.dispose();
    _contentFocusNode.dispose();
    super.dispose();

  }
  bool addDiarytoDB( Diary s){

    String userdir='users/${authservice.getcurrentUser()?.uid}';
    bool returnvalue=true;
    database.ref(userdir).push().set(s.toJSON()).catchError((onError)=> returnvalue=false);
    return returnvalue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text('당신의 일기',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 6,),
                Text('제목', style: TextStyle(fontSize: 16),),
                SizedBox(height: 6,),
                TextFormField(
                  controller: _titleCon,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()
                  ),
                  cursorColor: Colors.black,
                  onChanged: (text) {
                    // 등록 버튼 endabled 여부를 실시간 변경하기 위해 수시로 리빌드
                    setState(() {
                    });
                  },
                  onFieldSubmitted: (text) {
                    FocusScope.of(context).requestFocus(_contentFocusNode);
                  },
                  onSaved: (text) {
                    diary.title = text;
                  },
                ),
                SizedBox(height: 10,),
                Text('내용', style: TextStyle(fontSize: 16),),
                SizedBox(height: 6,),
                TextFormField(
                  controller: _contentCon,
                  focusNode: _contentFocusNode,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()
                  ),
                  cursorColor: Colors.black,
                  maxLines: 20,
                  onChanged: (text) {
                    // 하단 버튼 endabled 여부를 실시간 변경하기 위해 수시로 리빌드
                    setState(() {
                    });
                  },
                  onFieldSubmitted: (text) {
                    print('제출만 됨');
                  },
                  onSaved: (text) {
                    print('객체에 변수 전달 완료');
                    diary.content = text;
                  },

                ),
                SizedBox(height: 10,),
                /**
                 * CupertinoButton을 TextButton 대신 한번 써봤는데 더 이쁘당. 디자인
                 * 하기도 편하고 말이지.
                 */
                Align(
                    child: CupertinoButton(
                      child: Text('등록', style: TextStyle(color: Colors.black),),
                        color: Colors.yellow,
                        // 위 텍스트 필드 둘 다에 값이 있을 때 버튼이 활성화되도록!!
                        // null이면 버튼이 자동 비활성화 상태가 됨
                        onPressed:

                        _titleCon.text.isNotEmpty && _contentCon.text.isNotEmpty?
                            () {
                        setState(() {
                          _form.currentState!.save();
                          addDiarytoDB(Diary(diary.title,diary.content));
                          Navigator.pop(context);
                        });
                        _titleCon.clear();
                        _contentCon.clear();
                        // 현재 포커스되어 있는 위젯의 포커스를 해제한다.
                        FocusScope.of(context).unfocus();
                            }
                            :null
                  ),
                ),
                /**
                 * 여기부터 아래 부분은 그냥 텍스트가 잘 담기고 삭제되는지, 실험해보려고 둔
                 * 거니깐 코드 작성할 때 삭제해도 돼!
                 */


                Align(
                  child: CupertinoButton(
                      child: Text('삭제', style: TextStyle(color: Colors.black),),
                      color: Colors.yellow,
                      // 위 변수 2개중 하나에 값이 있을 때에만 버튼이 활성화되도록!!
                      // null이면 버튼이 자동 비활성화 상태가 됨
                      onPressed:
                          diary.title != null || diary.content != null?
                          () {
                        setState(() {
                          diary.title = null;
                          diary.content = null;
                        });


                      }:null

                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
