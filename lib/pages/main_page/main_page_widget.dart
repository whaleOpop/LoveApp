import '/components/primary_button/primary_button_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/theme/love_app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'main_page_model.dart';
export 'main_page_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

    final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 400.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 100.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 400.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 200.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, 400.0),
            end: Offset(0.0, 0.0),
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
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/backgroundMainPage.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(13, 60, 13, 30),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: '',
                                    options: FFButtonOptions(
                                      width: 54,
                                      height: 54,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 10, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: Colors.black,
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Color(0xFF433E45),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(27),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: SvgPicture.asset(
                                      'assets/images/icons/settings.svg',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: Container(
                              width: double.infinity,
                              height: 280,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xFF433E45),
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 15,
                                    sigmaY: 15,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 130, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          '36 дней',
                                          style: LoveAppTheme.miratrixLightTheme.textTheme.titleMedium,
                                        ),
                                        Text(
                                          'Вместе',
                                          style: LoveAppTheme.montserratLightTheme.textTheme.bodySmall,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30, 34, 30, 0),
                                          child: LinearPercentIndicator(
                                            percent: 0.7,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.78,
                                            lineHeight: 24,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: Color(0xFFDDA7BD),
                                            backgroundColor: Color(0x559CBAB7),
                                            center: Text(
                                              '70%',
                                              style: LoveAppTheme.montserratLightTheme.textTheme.labelSmall,
                                            ),
                                            barRadius: Radius.circular(12),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30, 4, 30, 26),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '0 дней',
                                                style: LoveAppTheme.miratrixLightTheme.textTheme.labelSmall,
                                              ),
                                              Text(
                                                '50 дней',
                                                style: LoveAppTheme.miratrixLightTheme.textTheme.labelSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(26, 0, 26, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.65, -0.89),
                                    child: Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
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
                                        borderRadius: BorderRadius.circular(85),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(99),
                                          child: Image.asset(
                                            'assets/images/1681271721_4-26.jpg',
                                            width: 135,
                                            height: 135,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      'Костя',
                                      style: LoveAppTheme.montserratLightTheme.textTheme.bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.65, -0.89),
                                    child: Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
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
                                        borderRadius: BorderRadius.circular(85),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(99),
                                          child: Image.network(
                                            'https://yobte.ru/uploads/posts/2019-11/devushki-s-golubymi-glazami-s-rusymi-volosami-41-foto-3.jpg',
                                            width: 135,
                                            height: 135,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Text(
                                      'Вера',
                                      style: LoveAppTheme.montserratLightTheme.textTheme.bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 24, 12, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Наша галлерея',
                           style: LoveAppTheme.miratrixLightTheme.textTheme.headlineMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                          child: Text(
                            '(14)',
                            style: LoveAppTheme.montserratLightTheme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 17, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            height: 290,
                            child: Stack(
                              alignment: AlignmentDirectional(0, 1),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        48, 0, 48, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        'https://avatars.dzeninfra.ru/get-zen_doc/4398042/pub_603d14186bbac837cd2f46fa_603d14afa3c2fb4774c1c13b/scale_1200',
                                        width: double.infinity,
                                        height: 260,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.99),
                                  child: wrapWithModel(
                                    model: _model.primaryButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PrimaryButtonWidget(
                                      actionText: 'посмотреть',
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/register');
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
