import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '짱구의 프로필',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/ko/4/4a/%EC%8B%A0%EC%A7%B1%EA%B5%AC.png'),
                  ),
                ),
                  SizedBox(height: 5,),
                  Text(
                    '신짱구',
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  )
                ]
              ),
              _buildInfo('팔로잉','10'),
              _buildInfo('팔로우','12'),
              _buildInfo('게시물 수','3'),
            ],
          ),
          SizedBox(height: 10,),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(child: Icon(Icons.library_books, color: Colors.black,)),
              Tab(child:Icon(Icons.account_box, color: Colors.black,),)
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: List.generate(10,(index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Container(
                          height: 100,
                          color: Colors.amberAccent,
                          child: Text('내가 쓴 일기'),
                        )
                    );
                  })
                ),
                ListView(
                    children: List.generate(10,(index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Container(
                            height: 100,
                            color: Colors.greenAccent,
                            child: Text('내가 좋아요 한 일기'),
                          )
                      );
                    })
                ),
              ],
            ),
          )
        ],

      ),
    );
}



  _buildInfo(String title, String count) {
    return Column(
      children: [
        SizedBox(height: 8,),
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 5,),
        Text(
          count,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
