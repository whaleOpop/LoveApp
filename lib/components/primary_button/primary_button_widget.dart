import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:loveapp/theme/love_app_theme.dart';

import 'primary_button_model.dart';
export 'primary_button_model.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget({
    super.key,
    String? actionText,
    required this.onPressed,
  }) : actionText = actionText ?? 'Action';

  final String actionText;
  final VoidCallback onPressed;
  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  late PrimaryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryButtonModel());
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
        gradient: const LinearGradient(
          colors: [
            Color(0xFF82FCF5),
            Color(0xFFC4A7FB),
            Color(0xFFDDA7BD),
            Color(0xFFF5AD73)
          ],
          stops: [0, 0.4, 0.7, 1],
          begin: AlignmentDirectional(-1, -1),
          end: AlignmentDirectional(1, 1),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
          child: FFButtonWidget(
            onPressed: widget.onPressed,
            text: widget.actionText,
            options: FFButtonOptions(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: Colors.transparent,
              textStyle: LoveAppTheme.miratrixLightTheme.textTheme.labelLarge,
              elevation: 0,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
