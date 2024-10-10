import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'input_text_widget.dart' show InputTextWidget;
import 'package:flutter/material.dart';

class InputTextModel extends FlutterFlowModel<InputTextWidget> {
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
