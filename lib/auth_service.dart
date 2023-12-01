import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:provider_firebase/model_class.dart';

class AuthService {
  auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// A function that converts a firebase_auth.User to a custom User object (UserModel).
  User? userFromFirestore(auth.User? user) {
    // Check if the firebaseUser is null (not authenticated).
    if (user == null) {
      return null;
    }
    // If authenticated, create and return a custom User object (UserModel).
    return User(uid: user.uid, email: user.email);
  }

// A getter that provides a stream of custom User objects (UserModel).
  Stream<User?>? get user {
    // Utilize the authStateChanges stream from Firebase Authentication.
    // // Map each event in the stream to a custom User object using userFromFirestore.
    return firebaseAuth.authStateChanges().map(userFromFirestore);
  }

  Future<User?> signInUser(String email, String password) async {
    final credential =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userFromFirestore(credential.user);
  }

  Future<User?> createUser(String email, String password) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userFromFirestore(credential.user);
  }

  Future<void> signOut() async{
    return await firebaseAuth.signOut();
  }

  // Add a getter for the current user
  User? get currentUser => getCurrentUser();

  User? getCurrentUser() {
    // Your logic to retrieve the current user goes here
    // For example, if you're using Firebase Authentication:
    // return FirebaseAuth.instance.currentUser;
    return null; // Replace this line with your actual implementation
  }
}
