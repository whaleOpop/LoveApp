import 'package:flutter/material.dart';
import 'package:loveapp/pages/home_page/home_page_widget.dart';
import 'theme/love_app_theme.dart';
import 'package:flutter/services.dart';


import 'package:loveapp/pages/register_page/register_widget.dart';
import 'package:loveapp/pages/login_page/login_widget.dart';
import 'package:loveapp/pages/codeInput_page/codeInput_widget.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Love App',
        routes: {
          '/login': (context) => const LoginWidget(),
          '/register': (context) => const RegisterWidget(),
          '/codeInput': (context) => const CodeInputWidget(),
        },
        debugShowCheckedModeBanner: false,
        theme: LoveAppTheme.miratrixLightTheme,
        home: const HomePageWidget());
  }
}
