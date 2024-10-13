
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import '/components/primary_button/primary_button_widget.dart';
import '/components/sub_button/sub_button_widget.dart';
import 'partner_widget.dart' show PartnerWidget;



class PartnerModel extends FlutterFlowModel<PartnerWidget> {
  late PrimaryButtonModel primaryButtonModel;
  late SubButtonModel subButtonModel;

  @override
  void initState(BuildContext context) {
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    subButtonModel = createModel(context, () => SubButtonModel());
  }

  @override
  void dispose() {
    primaryButtonModel.dispose();
    subButtonModel.dispose();
  }
}
