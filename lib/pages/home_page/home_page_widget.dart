import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loveapp/theme/custom_theme.dart';
import 'package:flutter/services.dart'; // Для работы с SystemChrome
import 'home_page_model.dart';
export 'home_page_model.dart';
import 'package:status_bar_control/status_bar_control.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    StatusBarControl.setHidden(true);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomTheme.lightTheme.scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/iPhone_14_&_15_Pro_-_29.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Be loved',
                    style: CustomTheme.lightTheme.textTheme.bodyMedium,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(70, 0, 70, 86),
                    child: Text(
                      'Больше, чем просто пара — это ваши общие воспоминания',
                      textAlign: TextAlign.center,
                      style: CustomTheme.lightTheme.textTheme.bodySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                    child: Container(
                      width: 355,
                      height: 54,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF82FCF5),
                            Color(0xFFC4A7FB),
                            Color(0xFFDDA7BD),
                            Color(0xFFF5AD73)
                          ],
                          stops: [0, 0.4, 0.7, 1],
                          begin: AlignmentDirectional(-1, -1),
                          end: AlignmentDirectional(1, 1),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'войти',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: double.infinity,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 0, 16, 0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 0),
                              color: Colors.transparent,
                              textStyle:
                                  CustomTheme.lightTheme.textTheme.titleSmall,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 355,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white),
                    ),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Зарегистрироваться',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: double.infinity,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: const Color.fromARGB(0, 255, 255, 255),
                        textStyle: const TextStyle(
                          fontFamily: 'Miratrix',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 105,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
