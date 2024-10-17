import 'package:loveapp/theme/love_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/sub_button/sub_button_widget.dart';


import 'partner_model.dart';
export 'partner_model.dart';

class PartnerWidget extends StatefulWidget {
  const PartnerWidget({super.key});

  @override
  State<PartnerWidget> createState() => _PartnerWidgetState();
}

class _PartnerWidgetState extends State<PartnerWidget> {
  
  late PartnerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartnerModel());

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
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Stack(
                            alignment: const AlignmentDirectional(0, 0),
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-0.54, 0.45),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 100),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image.asset(
                                      'assets/images/heartRight.png',
                                      width: 180,
                                      height: 180,
                                      fit: BoxFit.fill,
                                      alignment: const Alignment(0, 0),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 100, 0, 50),
                                child: Container(
                                  width: 170,
                                  height: 170,
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
                                    borderRadius: BorderRadius.circular(85),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(99),
                                      child: Image.asset(
                                        'assets/images/1681271721_4-26.jpg',
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.54, 0.2),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 150, 0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image.asset(
                                      'assets/images/heartLeft.png',
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.contain,
                                      alignment: const Alignment(0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Text(
                          'Кирилл',
                          style: LoveAppTheme.miratrixLightTheme.textTheme.headlineLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(70, 0, 70, 160),
                        child: Text(
                          'Ваш партнер?',
                          textAlign: TextAlign.center,
                          style: LoveAppTheme.montserratLightTheme.textTheme.bodySmall
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0, 0, 0, 10),
                        child: wrapWithModel(
                          model: _model.primaryButtonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PrimaryButtonWidget(
                            actionText: 'да, все верно',
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                          ),
                        ).animateOnPageLoad(animationsMap[
                            'primaryButtonOnPageLoadAnimation']!),
                      ),
                      wrapWithModel(
                        model: _model.subButtonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SubButtonWidget(
                          actionText: 'Ввести код заново',
                          onPressed: () {
                            Navigator.pushNamed(context, '/codeInput');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
