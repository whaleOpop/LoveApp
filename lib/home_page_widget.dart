import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';


import 'home_page_model.dart';
export 'home_page_model.dart';

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
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFD2D0C3),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 150),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Momentus',
                    style: TextStyle(
                      fontFamily: 'Montserrat Alternates',
                      color: Color(0xFF7F5E4B),
                      fontSize: 32,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(70, 0, 70, 44),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                            fontFamily: 'Montserrat Alternates',
                            color: Color(0xFF7F5E4B),
                            fontSize: 12,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0.5),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Войти',
                      options: FFButtonOptions(
                        width: 320,
                        height: 44,
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: const Color(0xFFF4F3EA),
                        textStyle:
                            const TextStyle(
                                  fontFamily: 'Montserrat Alternates',
                                  color: Color(0xFF7F5E4B),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0.5),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Зарегистрироваться',
                        options: FFButtonOptions(
                          width: 320,
                          height: 44,
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFF9CBAB7),
                          textStyle:
                              const TextStyle(
                                    fontFamily: 'Montserrat Alternates',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
