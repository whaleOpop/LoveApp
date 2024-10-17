import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loveapp/theme/love_app_theme.dart';

import 'secondary_button_model.dart';
export 'secondary_button_model.dart';

class SecondaryButtonWidget extends StatefulWidget {
  const SecondaryButtonWidget({
    super.key,
    String? actionText,
    required this.onPressed,
  }) : actionText = actionText ?? 'Action';

  final String actionText;
  final VoidCallback onPressed;
  @override
  State<SecondaryButtonWidget> createState() => _SecondaryButtonWidgetState();
}

class _SecondaryButtonWidgetState extends State<SecondaryButtonWidget> {
  late SecondaryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecondaryButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: FFButtonWidget(
        onPressed: widget.onPressed,
        text: widget.actionText,
        options: FFButtonOptions(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          color: Colors.transparent,
          textStyle: LoveAppTheme.miratrixLightTheme.textTheme.labelMedium,
          elevation: 0,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
