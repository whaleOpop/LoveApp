import 'package:loveapp/theme/love_app_theme.dart';

import 'package:loveapp/pages/register_page/register_widget.dart';

import '/components/input_password/input_password_widget.dart';
import '/components/input_phone/input_phone_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/sub_button/sub_button_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 800.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'primaryButtonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
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
        backgroundColor:
            LoveAppTheme.miratrixLightTheme.scaffoldBackgroundColor,
        body: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/background.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 460,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        border: Border.all(
                          color: Color(0xFF433E45),
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 15,
                            sigmaY: 15,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    'Здравствуйте!',
                                    style: LoveAppTheme.miratrixLightTheme
                                        .textTheme.bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      70, 0, 70, 40),
                                  child: Text(
                                    'Больше, чем просто пара — это ваши общие воспоминания',
                                    textAlign: TextAlign.center,
                                    style: LoveAppTheme.montserratLightTheme
                                          .textTheme.bodyMedium
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 26),
                                    child: wrapWithModel(
                                      model: _model.inputPhoneModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: InputPhoneWidget(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 50),
                                  child: wrapWithModel(
                                    model: _model.inputPasswordModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: InputPasswordWidget(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: wrapWithModel(
                                    model: _model.primaryButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PrimaryButtonWidget(
                                      actionText: 'войти',
                                      onPressed: () {},
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'primaryButtonOnPageLoadAnimation']!),
                                ),
                                wrapWithModel(
                                  model: _model.subButtonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SubButtonWidget(
                                    actionText: 'Нет аккаунта? Зарегистрироваться',
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/register');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
