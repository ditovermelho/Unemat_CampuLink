import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFieldEmailLg widget.
  TextEditingController? textFieldEmailLgController;
  String? Function(BuildContext, String?)? textFieldEmailLgControllerValidator;
  // State field(s) for TextFieldSenhalLg widget.
  TextEditingController? textFieldSenhalLgController;
  late bool textFieldSenhalLgVisibility;
  String? Function(BuildContext, String?)? textFieldSenhalLgControllerValidator;
  // State field(s) for TextFielNomeCd widget.
  TextEditingController? textFielNomeCdController;
  String? Function(BuildContext, String?)? textFielNomeCdControllerValidator;
  // State field(s) for TextFielTelefoneCd widget.
  TextEditingController? textFielTelefoneCdController;
  String? Function(BuildContext, String?)?
      textFielTelefoneCdControllerValidator;
  // State field(s) for TextFieldEmailCd widget.
  TextEditingController? textFieldEmailCdController;
  String? Function(BuildContext, String?)? textFieldEmailCdControllerValidator;
  // State field(s) for TextFieldSenhalCd1 widget.
  TextEditingController? textFieldSenhalCd1Controller;
  late bool textFieldSenhalCd1Visibility;
  String? Function(BuildContext, String?)?
      textFieldSenhalCd1ControllerValidator;
  // State field(s) for TextFieldSenhalCd2 widget.
  TextEditingController? textFieldSenhalCd2Controller;
  late bool textFieldSenhalCd2Visibility;
  String? Function(BuildContext, String?)?
      textFieldSenhalCd2ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldSenhalLgVisibility = false;
    textFieldSenhalCd1Visibility = false;
    textFieldSenhalCd2Visibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldEmailLgController?.dispose();
    textFieldSenhalLgController?.dispose();
    textFielNomeCdController?.dispose();
    textFielTelefoneCdController?.dispose();
    textFieldEmailCdController?.dispose();
    textFieldSenhalCd1Controller?.dispose();
    textFieldSenhalCd2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
