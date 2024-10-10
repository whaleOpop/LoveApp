import 'package:flutter/material.dart';
import 'package:loveapp/pages/home_page/home_page_widget.dart';
import 'theme/love_app_theme.dart';
import 'package:flutter/services.dart';

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
        debugShowCheckedModeBanner: true,
        theme: LoveAppTheme.miratrixLightTheme,
        home: const HomePageWidget());
  }
}
