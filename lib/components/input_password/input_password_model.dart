import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'input_password_widget.dart' show InputPasswordWidget;
import 'package:flutter/material.dart';


class InputPasswordModel extends FlutterFlowModel<InputPasswordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
