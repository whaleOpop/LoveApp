import '/components/primary_button/primary_button_widget.dart';
import '/components/secondary_button/secondary_button_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import '/theme/love_app_theme.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

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
    return MediaQuery.removePadding(
        context: context,
        removeTop: true, // Remove only the top padding
        child: ListView(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            children: [
              GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: WillPopScope(
                  onWillPop: () async => false,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    color:
                        LoveAppTheme.miratrixLightTheme.scaffoldBackgroundColor,
                    child: Align(
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
                                          .textTheme.bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          70, 0, 70, 86),
                                      child: Text(
                                        'Ваш общий дневник любви',
                                        textAlign: TextAlign.center,
                                        style: LoveAppTheme.montserratLightTheme
                                            .textTheme.bodyMedium,
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
