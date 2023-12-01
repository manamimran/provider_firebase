
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_firebase/model_class.dart';
import 'package:provider_firebase/screens/home_screen.dart';

import '../auth_service.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          TextField(
            controller: email_controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                labelText: "Email"),
          ),
          SizedBox(height: 20),
          TextField(
            controller: password_controller,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              labelText: "Password",
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  await authService.signInUser(
                      email_controller.text, password_controller.text);
                  print('Signed In Sucessfully');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } catch (e) {
                  print("Error: $e");
                }
              },
              child: Text("LogIn")),
          ElevatedButton(
              onPressed: () async {
                try {
                  await authService.createUser(
                      email_controller.text, password_controller.text).then((value) async {

                        //validate of current user via auth
                    var uid = authService.firebaseAuth.currentUser!.uid;

                    //passing values to Model
                    final user = User(uid: uid, email: email_controller.text);

                    //creating users named collection in firestore via uid
                    final doc = authService.firestore
                        .collection("users")
                        .doc(uid);
                    // Save the Model to Firestore
                    await doc.set(user.toMap());
                    print('data added');

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  });
                  print('New Account Created Successfully');
                  // Navigator.pop(context);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } catch (e) {
                  print("Error: $e");
                }
              },
              child: Text("SignUp"))
        ],
      ),
    );
  }
}
