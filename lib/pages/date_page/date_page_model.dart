import 'date_page_widget.dart' show PickDataWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/components/primary_button/primary_button_widget.dart';

class PickDataModel extends FlutterFlowModel<PickDataWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '##.##.####');
  String? Function(BuildContext, String?)? textControllerValidator;
  late PrimaryButtonModel primaryButtonModel;

  @override
  void initState(BuildContext context) {
     primaryButtonModel = createModel(context, () => PrimaryButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
    primaryButtonModel.dispose();
  }
}
