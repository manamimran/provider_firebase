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
    final User? user = authService.currentUser;

    if (user != null) {
      // User is authenticated, navigate to HomeScreen
      return HomeScreen();
    } else {
      // User is not authenticated, navigate to LoginScreen
      return LoginScreen();
    }
  }

}