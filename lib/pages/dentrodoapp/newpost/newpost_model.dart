import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'newpost_widget.dart' show NewpostWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewpostModel extends FlutterFlowModel<NewpostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFieldTitulo widget.
  FocusNode? textFieldTituloFocusNode;
  TextEditingController? textFieldTituloController;
  String? Function(BuildContext, String?)? textFieldTituloControllerValidator;
  // State field(s) for TextFieldmensagem widget.
  FocusNode? textFieldmensagemFocusNode;
  TextEditingController? textFieldmensagemController;
  String? Function(BuildContext, String?)? textFieldmensagemControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? newPost;
  // State field(s) for TextFieldNome widget.
  FocusNode? textFieldNomeFocusNode;
  TextEditingController? textFieldNomeController;
  String? Function(BuildContext, String?)? textFieldNomeControllerValidator;
  // State field(s) for TextFielDescricao widget.
  FocusNode? textFielDescricaoFocusNode;
  TextEditingController? textFielDescricaoController;
  String? Function(BuildContext, String?)? textFielDescricaoControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GroupRecord? groupRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GruopMebresRecord? member;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldTituloFocusNode?.dispose();
    textFieldTituloController?.dispose();

    textFieldmensagemFocusNode?.dispose();
    textFieldmensagemController?.dispose();

    textFieldNomeFocusNode?.dispose();
    textFieldNomeController?.dispose();

    textFielDescricaoFocusNode?.dispose();
    textFielDescricaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
