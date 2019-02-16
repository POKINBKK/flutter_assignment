import 'package:flutter/material.dart';
import './ui/loginForm.dart';
import './ui/registerForm.dart';
import './ui/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginForm(),
        "/register": (context) => RegisterForm(),
         "/": (context) => MainPage(),
      }
    );
  }
}
