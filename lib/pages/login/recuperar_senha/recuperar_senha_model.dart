import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'recuperar_senha_widget.dart' show RecuperarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecuperarSenhaModel extends FlutterFlowModel<RecuperarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldEmailRecup widget.
  FocusNode? textFieldEmailRecupFocusNode;
  TextEditingController? textFieldEmailRecupController;
  String? Function(BuildContext, String?)?
      textFieldEmailRecupControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldEmailRecupFocusNode?.dispose();
    textFieldEmailRecupController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
