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
        title: Text('짱구의 프로필',
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/ko/4/4a/%EC%8B%A0%EC%A7%B1%EA%B5%AC.png'),
                ),
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
                Container(color: Colors.red,),
                Container(color: Colors.green,),
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
