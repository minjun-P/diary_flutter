import 'package:firebase_auth/firebase_auth.dart';

class authservice {

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
static Future<User?> register( String email, String password ,String nickname) async {
  User? user;
  try {
    UserCredential s= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await user!.updateDisplayName(nickname);
    await user.reload();
    user=FirebaseAuth.instance.currentUser;
    return user;

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



