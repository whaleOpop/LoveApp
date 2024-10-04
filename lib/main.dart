import 'package:flutter/material.dart';
import 'package:loveapp/pages/home_page/home_page_widget.dart';
import 'theme/custom_theme.dart';
import 'package:flutter/services.dart';
import 'package:status_bar_control/status_bar_control.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StatusBarControl.setHidden(true, animation:StatusBarAnimation.SLIDE);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Love App',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: const HomePageWidget());
  }
}
