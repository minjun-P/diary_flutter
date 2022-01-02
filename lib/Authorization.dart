import 'package:firebase_auth/firebase_auth.dart';
/*class authservice(){
  final auth.FirebaseAuth _firebaseauth=auth.FirebaseAuth.instance();
  User ? _userFromFiewbase(auth.User? user){
    if(user==null)
{ return null;
}
    return User(user.uid,user.email);
}
}*/

Future<bool> signin( String email, String password ) async {
  try {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    return true;
  }catch(e){
    print(e);
    return false;
  }
}

Future<bool> register( String email, String password ,String nickname) async {
  try {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  }catch(e){
    print(e);
    return false;
  }

}