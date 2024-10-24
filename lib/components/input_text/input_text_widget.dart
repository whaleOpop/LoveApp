import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loveapp/theme/love_app_theme.dart';

import 'input_text_model.dart';
export 'input_text_model.dart';

class InputTextWidget extends StatefulWidget {
  const InputTextWidget({super.key});

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  late InputTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputTextModel());

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
          textCapitalization: TextCapitalization.words,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Имя',
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
          cursorColor: Colors.white,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
