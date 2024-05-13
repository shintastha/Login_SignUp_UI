import 'package:flutter/material.dart';
import 'package:login_signup_ui/login_page.dart';
import 'package:login_signup_ui/password_visibility_provider.dart';
import 'package:provider/provider.dart';
// import 'package:login_signup_ui/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PasswordVisibilityProvider>(
      create: (context) => PasswordVisibilityProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DMSans'),
        home: const LoginPage(),
      ),
    );
  }
}
