import '/components/input_password/input_password_widget.dart';
import '/components/input_phone/input_phone_widget.dart';
import '/components/input_text/input_text_widget.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/sub_button/sub_button_widget.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';


class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for InputText component.
  late InputTextModel inputTextModel;
  // Model for InputPhone component.
  late InputPhoneModel inputPhoneModel;
  // Model for InputPassword component.
  late InputPasswordModel inputPasswordModel;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for SubButton component.
  late SubButtonModel subButtonModel;

  @override
  void initState(BuildContext context) {
    inputTextModel = createModel(context, () => InputTextModel());
    inputPhoneModel = createModel(context, () => InputPhoneModel());
    inputPasswordModel = createModel(context, () => InputPasswordModel());
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    subButtonModel = createModel(context, () => SubButtonModel());
  }

  @override
  void dispose() {
    inputTextModel.dispose();
    inputPhoneModel.dispose();
    inputPasswordModel.dispose();
    primaryButtonModel.dispose();
    subButtonModel.dispose();
  }
}
