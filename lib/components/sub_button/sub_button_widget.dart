import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loveapp/theme/love_app_theme.dart';

import 'sub_button_model.dart';
export 'sub_button_model.dart';

class SubButtonWidget extends StatefulWidget {
  const SubButtonWidget({
    super.key,
    String? actionText,
    required this.onPressed,
  }) : actionText = actionText ?? 'Action';

  final String actionText;
  final VoidCallback onPressed;

  @override
  State<SubButtonWidget> createState() => _SubButtonWidgetState();
}

class _SubButtonWidgetState extends State<SubButtonWidget> {
  late SubButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubButtonModel());
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
      child: FFButtonWidget(
        onPressed: widget.onPressed,
        text: widget.actionText,
        options: FFButtonOptions(
          height: 40,
          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          color: Colors.transparent,
          textStyle: LoveAppTheme.montserratLightTheme.textTheme.titleSmall,
          elevation: 0,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
