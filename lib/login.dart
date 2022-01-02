import 'package:flutter/material.dart';
import 'components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            _loginIconBuilder('로그인하기', 150),
            LoginForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('계정이 없다면?'),
                TextButton(
                  child: Text('회원가입'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}
Widget _loginIconBuilder(String title, double size) {
  return Column(
    children: [
      Icon(Icons.menu_book,size: size),
      Text(
        title,
        style: TextStyle(fontSize: size/4, fontWeight: FontWeight.bold),
      )

    ],
  );
}


