import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'group_post_widget.dart' show GroupPostWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroupPostModel extends FlutterFlowModel<GroupPostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldTitulo widget.
  FocusNode? textFieldTituloFocusNode;
  TextEditingController? textFieldTituloController;
  String? Function(BuildContext, String?)? textFieldTituloControllerValidator;
  // State field(s) for TextFieldmensagem widget.
  FocusNode? textFieldmensagemFocusNode;
  TextEditingController? textFieldmensagemController;
  String? Function(BuildContext, String?)? textFieldmensagemControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostRecord? newPost;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldTituloFocusNode?.dispose();
    textFieldTituloController?.dispose();

    textFieldmensagemFocusNode?.dispose();
    textFieldmensagemController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
