import 'package:loveapp/theme/love_app_theme.dart';

import '/components/input_password/input_password_widget.dart';
import '/components/input_phone/input_phone_widget.dart';
import '/components/input_text/input_text_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/sub_button/sub_button_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'register_model.dart';
export 'register_model.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget>
    with TickerProviderStateMixin {
  late RegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(0.0, 800.0),
            end: const Offset(0.0, 0.0),
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
            color: const Color(0x80FFFFFF),
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
          alignment: const AlignmentDirectional(0, 0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/images/backgroundHelloPage.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 575,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        border: Border.all(
                          color: const Color(0xFF433E45),
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
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
                                const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Text(
                                    'Приветствуем!',
                                    style: LoveAppTheme.miratrixLightTheme
                                        .textTheme.headlineLarge,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      70, 0, 70, 40),
                                  child: Text(
                                      'Больше, чем просто пара — это ваши общие воспоминания',
                                      textAlign: TextAlign.center,
                                      style: LoveAppTheme.montserratLightTheme
                                          .textTheme.bodySmall),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 26),
                                  child: wrapWithModel(
                                    model: _model.inputTextModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const InputTextWidget(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 26),
                                  child: wrapWithModel(
                                    model: _model.inputPhoneModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const InputPhoneWidget(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 48),
                                  child: wrapWithModel(
                                    model: _model.inputPasswordModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const InputPasswordWidget(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: wrapWithModel(
                                    model: _model.primaryButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PrimaryButtonWidget(
                                        actionText: 'Зарегистрироваться',
                                        onPressed: () {}),
                                  ).animateOnPageLoad(animationsMap[
                                      'primaryButtonOnPageLoadAnimation']!),
                                ),
                                wrapWithModel(
                                  model: _model.subButtonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SubButtonWidget(
                                    actionText: 'Уже есть аккаунт? Войти',
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
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
