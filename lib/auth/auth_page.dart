import 'package:flutter/material.dart';
import 'package:smart_parking/pages/login_page.dart';
import 'package:smart_parking/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggelScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showResisterPage: toggelScreens);
    } else {
      return RegisterPage(showLoginPage: toggelScreens);
    }
  }
}
