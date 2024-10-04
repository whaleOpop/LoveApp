import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loveapp/pages/home_page/home_page_widget.dart';
import 'theme/custom_theme.dart';
import 'package:loveapp/theme/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love App',
      theme: CustomTheme.lightTheme,
      home: const HomePageWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

