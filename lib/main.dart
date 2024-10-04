import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loveapp/pages/home_page/home_page_widget.dart';
import 'theme/custom_theme.dart';
import 'package:loveapp/theme/custom_theme.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love App',
      theme: CustomTheme.lightTheme,
      home: const SafeArea(child: HomePageWidget()),
      debugShowCheckedModeBanner: false,
    );
  }
}
