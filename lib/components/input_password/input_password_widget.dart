import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loveapp/theme/love_app_theme.dart';

import 'input_password_model.dart';
export 'input_password_model.dart';

class InputPasswordWidget extends StatefulWidget {
  const InputPasswordWidget({super.key});

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  late InputPasswordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputPasswordModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: SizedBox(
        width: 266,
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Пароль',
            hintStyle: LoveAppTheme.montserratLightTheme.textTheme.bodyMedium,
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
          ),
          style: LoveAppTheme.montserratLightTheme.textTheme.bodyMedium,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: Colors.white,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
