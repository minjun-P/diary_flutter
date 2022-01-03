import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _titleCon = TextEditingController();
  final _contentCon = TextEditingController();

  // 입력 값을 저장할 변수 만들어놓기
  String? _title;
  String? _content;


  @override
  void dispose() {
    // TODO: implement dispose
    _titleCon.dispose();
    _contentCon.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
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
                    // 하단 버튼 endabled 여부를 실시간 변경하기 위해 수시로 리빌드
                    setState(() {

                    });

                  },
                  onFieldSubmitted: (text) {
                    print(text);
                    _titleCon.clear();
                  },
                ),
                SizedBox(height: 10,),
                Text('내용', style: TextStyle(fontSize: 16),),
                SizedBox(height: 6,),
                TextFormField(
                  controller: _contentCon,
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

                ),
                SizedBox(height: 10,),
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
                          _title = _titleCon.text;
                          _content = _contentCon.text;
                        });


                            }
                            :null
                  ),
                ),
                Text(_title ?? '값 없음'),
                Text(_content ?? '값 없음'),
                Align(
                  child: CupertinoButton(
                      child: Text('삭제', style: TextStyle(color: Colors.black),),
                      color: Colors.yellow,
                      // 위 변수 2개중 하나에 값이 있을 때에만 버튼이 활성화되도록!!
                      // null이면 버튼이 자동 비활성화 상태가 됨
                      onPressed:
                          _title != null || _content != null?
                          () {
                        setState(() {
                          _title = null;
                          _content = null;
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
