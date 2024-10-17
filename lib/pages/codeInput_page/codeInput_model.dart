import '/components/primary_button/primary_button_widget.dart';
import '/components/sub_button/sub_button_widget.dart';


import 'codeInput_widget.dart' show CodeInputWidget;
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class CodeInputModel extends FlutterFlowModel<CodeInputWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for SubButton component.
  late SubButtonModel subButtonModel;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    subButtonModel = createModel(context, () => SubButtonModel());
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
    primaryButtonModel.dispose();
    subButtonModel.dispose();
  }
}
