import 'package:flutter/material.dart';
import '/components/primary_button/primary_button_widget.dart';
import 'package:loveapp/theme/love_app_theme.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

import 'date_page_model.dart';
export 'date_page_model.dart';

class PickDataWidget extends StatefulWidget {
  const PickDataWidget({super.key});

  @override
  State<PickDataWidget> createState() => _PickDataWidgetState();
}

class _PickDataWidgetState extends State<PickDataWidget> {
  late PickDataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickDataModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/backgroundDatePage.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 110),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'День х',
                      style: LoveAppTheme.miratrixLightTheme.textTheme.headlineLarge,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(70, 0, 70, 150),
                      child: Text(
                        'Укажи первый день вашей пары',
                        textAlign: TextAlign.center,
                        style: LoveAppTheme.montserratLightTheme.textTheme.bodySmall,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 182),
                        child: Container(
                          width: 266,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Ввести дату',
                              hintStyle: LoveAppTheme.miratrixLightTheme.textTheme.titleLarge,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                            ),
                            style: LoveAppTheme.miratrixLightTheme.textTheme.titleLarge,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.datetime,
                            cursorColor: Colors.white,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.textFieldMask],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                      child: Container(
                        width: 355,
                        height: 54,
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
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                            child: wrapWithModel(
                              model: _model.primaryButtonModel,
                              updateCallback: () =>
                                  safeSetState(() {}),
                              child: PrimaryButtonWidget(
                                actionText: 'Дальше',
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/main');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
