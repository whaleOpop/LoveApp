import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:loveapp/components/primary_button/primary_button_widget.dart';
import 'package:loveapp/components/secondary_button/secondary_button_widget.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PrimaryButton component.
  late PrimaryButtonModel primaryButtonModel;
  // Model for SecondaryButton component.
  late SecondaryButtonModel secondaryButtonModel;

  @override
  void initState(BuildContext context) {
    primaryButtonModel = createModel(context, () => PrimaryButtonModel());
    secondaryButtonModel = createModel(context, () => SecondaryButtonModel());
  }

  @override
  void dispose() {
    primaryButtonModel.dispose();
    secondaryButtonModel.dispose();
  }
}
