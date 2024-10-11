import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liam_game/pages/sign_in/sign_in_screen.dart';
import 'package:liam_game/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: kDebugMode,
      home: const SignInScreen(),
    );
  }
}
