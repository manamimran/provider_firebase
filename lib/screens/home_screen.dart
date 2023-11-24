import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
              Text("welcome to home page"),
              ElevatedButton(onPressed: (){
                authService.signOut();
                  print('Signed Out Successfully');
                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
              }, child: Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }

}