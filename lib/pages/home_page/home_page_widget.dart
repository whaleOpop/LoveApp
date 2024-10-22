

import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import '/theme/love_app_theme.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    animationsMap.addAll({
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

    Flutter3DController controller = Flutter3DController();
    controller.onModelLoaded.addListener(() {
      debugPrint('model is loaded : ${controller.onModelLoaded.value}');
      controller.resetCameraOrbit();
      controller.setCameraOrbit(-20, 120, 360);
    });

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            children: [
              GestureDetector(
                onPanEnd: (_) {
                  controller.setCameraOrbit(-20, 120, 360);
                },
                child: WillPopScope(
                  onWillPop: () async => false,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    color: const Color.fromARGB(255, 16, 14, 21),
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: SizedBox(  
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                              SizedBox(
                                width: 400,
                                height: 400,
                                child: Flutter3DViewer(
                                  activeGestureInterceptor: true,
                                  enableTouch: true,
                                  controller: controller,
                                  src: 'assets/3dmodels/test.glb',
                                ),
                              ),

                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 100),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Be loved',
                                      style: LoveAppTheme.miratrixLightTheme
                                          .textTheme.headlineLarge,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          70, 0, 70, 86),
                                      child: Text(
                                        'Ваш общий дневник любви',
                                        textAlign: TextAlign.center,
                                        style: LoveAppTheme.montserratLightTheme
                                            .textTheme.bodySmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 14),
                                      child: wrapWithModel(
                                        model: _model.primaryButtonModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: PrimaryButtonWidget(
                                          actionText: 'Войти',
                                          onPressed: () {
                                            HapticFeedback.mediumImpact();
                                            Navigator.pushNamed(
                                                context, '/login');
                                          },
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'primaryButtonOnPageLoadAnimation']!),
                                    ),
                                    wrapWithModel(
                                      model: _model.secondaryButtonModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SecondaryButtonWidget(
                                        actionText: 'Зарегистрироваться',
                                        onPressed: () {
                                          HapticFeedback.mediumImpact();
                                          Navigator.pushNamed(
                                              context, '/register');
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
                  ),
                ),
              )
            ]));
  }
}
