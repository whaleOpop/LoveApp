import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loveapp/theme/love_app_theme.dart';

import 'input_phone_model.dart';
export 'input_phone_model.dart';

class InputPhoneWidget extends StatefulWidget {
  const InputPhoneWidget({super.key});

  @override
  State<InputPhoneWidget> createState() => _InputPhoneWidgetState();
}

class _InputPhoneWidgetState extends State<InputPhoneWidget> {
  late InputPhoneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputPhoneModel());

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
            hintText: 'Телефон',
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
          keyboardType: TextInputType.number,
          cursorColor: Colors.white,
          validator: _model.textControllerValidator.asValidator(context),
          inputFormatters: [_model.textFieldMask],
        ),
      ),
    );
  }
}
