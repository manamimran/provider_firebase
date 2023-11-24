import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:provider_firebase/model_class.dart';

class AuthService {
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirestore(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid, email: user.email);
  }

  Stream<User?>? get user {
    return firebaseAuth.authStateChanges().map(_userFromFirestore);
  }

  Future<User?> signInUser(
      String email, String password) async {
    final credential =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirestore(credential.user);
  }

  Future<User?> createUser(
      String email, String password) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirestore(credential.user);

  }

  Future<void> signOut() async{
    return await firebaseAuth.signOut();
  }
}
