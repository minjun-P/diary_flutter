import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyHomePage'),),

      body: Center(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(onPressed:(){
            setState(() {
              Navigator.pushNamed(context, '/login');
            });
          },
              child: Text('Logout')
          )
        ],
      )

    ),
    );

  }
}
