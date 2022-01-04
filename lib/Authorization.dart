import 'package:diary/create_diary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database= FirebaseDatabase.instance;
class authservice {
   //유저로그
  static Future<User?> signin( String email, String password ) async {
    User? user;
    try {
      UserCredential s= await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      return s.user;
    }catch(e){
      print(e);
      return null;
    }
  }
  //유저등
  static Future<User?> register( String email, String password ,String nickname) async {
    User? user;


    try {
      UserCredential s= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await s.user!.updateDisplayName(nickname);
      DatabaseReference reference=database.ref("users/${s.user!.uid}");
      print("Please dieeeee!!!!!!!!!");
      reference.update(Diary("","").toJSON());
      print("Please kill!!!!!!!!!");

      return s.user;
    }catch(e){
      print(e);
      return null;
    }

  }
  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  static User? getcurrentUser( ) {
    FirebaseAuth auth = FirebaseAuth.instance;

    User? currentuser = auth.currentUser;

    return currentuser;
  }

}