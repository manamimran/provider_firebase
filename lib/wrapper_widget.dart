import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_firebase/auth_service.dart';
import 'package:provider_firebase/screens/home_screen.dart';
import 'package:provider_firebase/screens/login_screen.dart';

import 'model_class.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(stream: authService.user, builder: (_, AsyncSnapshot<User?> snapshot){
      if(snapshot.connectionState == ConnectionState.active){
        final User? user =snapshot.data;
        return user == null ?LoginScreen() :HomeScreen();
      }
      else{
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });

  }

}