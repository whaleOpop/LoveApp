import '/components/primary_button/primary_button_widget.dart';
import '/components/sub_button/sub_button_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:loveapp/theme/love_app_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'codeInput_model.dart';
export 'codeInput_model.dart';

class CodeInputWidget extends StatefulWidget {
  const CodeInputWidget({super.key});

  @override
  State<CodeInputWidget> createState() => _CodeInputWidgetState();
}

class _CodeInputWidgetState extends State<CodeInputWidget>
    with TickerProviderStateMixin {
  late CodeInputModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodeInputModel());

    animationsMap.addAll({
      'primaryButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
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
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: LoveAppTheme.miratrixLightTheme.scaffoldBackgroundColor,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/backgroundCodePage.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Партнер',
                        style: LoveAppTheme.miratrixLightTheme.textTheme.headlineLarge,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(70, 0, 70, 26),
                        child: Text(
                          'Укажи код твоей второй половинки',
                          textAlign: TextAlign.center,
                          style: LoveAppTheme.montserratLightTheme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(60, 110, 60, 180),
                        child: PinCodeTextField(
                          autoDisposeControllers: false,
                          appContext: context,
                          length: 5,
                          textStyle: LoveAppTheme.miratrixLightTheme.textTheme.titleMedium,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          enableActiveFill: false,
                          autoFocus: true,
                          enablePinAutofill: false,
                          errorTextSpace: 16,
                          showCursor: true,
                          cursorColor: Colors.white,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            fieldHeight: 58,
                            fieldWidth: 44,
                            borderWidth: 1,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            shape: PinCodeFieldShape.box,
                            activeColor: Colors.white,
                            inactiveColor: Colors.white,
                            selectedColor: Colors.white,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.transparent,
                            selectedFillColor: Colors.transparent,
                          ),
                          controller: _model.pinCodeController,
                          onChanged: (_) {},
                          onCompleted: (_) async {
                            if (animationsMap[
                                    'primaryButtonOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'primaryButtonOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _model.pinCodeControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: wrapWithModel(
                          model: _model.primaryButtonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PrimaryButtonWidget(
                            actionText: 'Дальше',
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                          ),
                        ).animateOnActionTrigger(
                          animationsMap[
                              'primaryButtonOnActionTriggerAnimation']!,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.subButtonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SubButtonWidget(
                          actionText: 'У меня нет кода',
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
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
